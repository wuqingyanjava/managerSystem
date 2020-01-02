
package org.crown.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.crown.common.annotations.Resources;
import org.crown.enums.AuthTypeEnum;
import org.crown.enums.StatusEnum;
import org.crown.framework.controller.SuperController;
import org.crown.framework.responses.ApiResponses;
import org.crown.model.dto.ComboDTO;
import org.crown.model.entity.Advert;
import org.crown.model.parm.AdvertPARM;
import org.crown.service.IAdvertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * <p>
 * 广告表 前端控制器
 * </p>
 *
 * @author Caratacus
 */
@Api(tags = {"advert" }, description = "广告相关接口")
@RestController
@RequestMapping(value = "/advert" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Validated
@Slf4j
public class AdvertRestController extends SuperController {

    @Autowired
    private IAdvertService advertService;

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有音乐(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "advertName" , value = "需要查询的广告名" , paramType = "query")
    })
    @GetMapping
    public ApiResponses<IPage<Advert>> page(@RequestParam(value = "advertName" , required = false) String advertName
    ) {
        return success(advertService.pageAdvert(this.<Advert>getPage(), advertName));
    }


    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "查询所有广告")
    @GetMapping("/adverts")
    public ApiResponses<List<Advert>> list() {
        return success(advertService.list());
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询单个广告")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "广告ID" , required = true, paramType = "path")
    })
    @GetMapping("/{id}")
    public ApiResponses<Advert> get(@PathVariable("id") String id) {
        return success(advertService.getById(id));
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "添加广告")
    @PostMapping
    public ApiResponses<Void> create(@RequestBody @Validated(AdvertPARM.Create.class) AdvertPARM advertPARM) {
        advertPARM.setStatus(StatusEnum.NORMAL);
        Advert advert = advertPARM.convert(Advert.class);
        advertService.save(advert);
        return success(HttpStatus.CREATED);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "修改广告")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "广告ID" , required = true, paramType = "path")
    })
    @PutMapping("/{id}")
    public ApiResponses<Void> update(@PathVariable("id") String id, @RequestBody @Validated(AdvertPARM.Update.class) AdvertPARM advertPARM) {
        Advert advert = advertPARM.convert(Advert.class);
        advert.setId(id);
        advertService.updateById(advert);
        return success();
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "删除广告")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "广告ID" , required = true, paramType = "path")
    })
    @DeleteMapping("/{id}")
    public ApiResponses<Void> delete(@PathVariable("id") String id) {
        advertService.removeById(id);
        return success(HttpStatus.NO_CONTENT);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation("设置广告状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "广告ID" , required = true, paramType = "path")
    })
    @PutMapping("/{id}/status")
    public ApiResponses<Void> updateStatus(@PathVariable("id") Integer id, @RequestBody @Validated(AdvertPARM.Status.class) AdvertPARM advertPARM) {
        advertService.updateStatus(id, advertPARM.getStatus());
        return success();
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "上传图片")
    @PostMapping("/upload")
    public ApiResponses<String> upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return fail("上传失败，请选择文件");
        }
        String tempUrl = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort();
        String tempName = file.getOriginalFilename();
        String suffix = tempName.substring(tempName.lastIndexOf(".") + 1);
        String fileName = System.currentTimeMillis() + "." + suffix;
        String os = System.getProperty("os.name");
        String filePath = "";
        if (os.toLowerCase().startsWith("win")) {
            filePath = "E:/testupload/";
            tempUrl = filePath + fileName;
        } else {
            filePath = "/usr/local/apache-tomcat-8.5.42/webapps/upload/advertImg/";
            tempUrl = tempUrl+"/upload/"+fileName;
        }
        File dest = new File(filePath + fileName);
        try {
            file.transferTo(dest);
            log.info("上传成功");

            return success(tempUrl);
        } catch (IOException e) {
            log.error(e.toString(), e);
            return fail(e.toString());
        }
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "上传图片")
    @PostMapping("/uploadFtp")
    public ApiResponses<String> uploadFtp(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return fail("上传失败，请选择文件");
        }
        String tempName = file.getOriginalFilename();
        String suffix = tempName.substring(tempName.lastIndexOf(".") + 1);
        String fileName = System.currentTimeMillis() + "." + suffix;

        //服务器ip地址
        String url = "148.70.237.248";
        //FTP端口，默认是21（注意：SSH默认22）
        int port = 21;
        //登录用户名
        String username = "potato";
        //登录密码
        String password = "123456";
        FTPClient ftp = new FTPClient();
        int reply;

        ftp.setControlEncoding("UTF-8");

        try {
            //连接FTP服务器
            ftp.connect(url, port);
            //如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
            ftp.login(username, password);
            //如果reply的值是230,表示连接成功，530可能是用户名或者密码错误
            //500可能是/home/test目录不存在
            reply = ftp.getReplyCode();
            System.out.println(reply);

            String path = "/srv/upload";
            //检查上传路径是否存在 如果不存在返回false
            boolean flag = ftp.changeWorkingDirectory(path);
            if (!flag) {
                //创建上传的路径  该方法只能创建一级目录，在这里如果/home/ftpuser存在则可创建image
                ftp.makeDirectory(path);
            }
            //指定上传路径
            ftp.changeWorkingDirectory(path);


            InputStream input = new ByteArrayInputStream(file.getBytes());

            ftp.enterLocalPassiveMode();
            //需要添加这行代码，不然上传的文件为空
            ftp.setFileType(FTP.BINARY_FILE_TYPE);

            boolean g = ftp.storeFile(fileName, input);
            log.info("上传服务器：" + g);
            input.close();
            ftp.logout();
            return success(fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return success(fileName);
        }

    }
}

