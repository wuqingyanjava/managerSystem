
package org.crown.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.jsonwebtoken.Header;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.crown.common.annotations.Resources;
import org.crown.enums.AuthTypeEnum;
import org.crown.enums.StatusEnum;
import org.crown.framework.controller.SuperController;
import org.crown.framework.responses.ApiResponses;
import org.crown.model.entity.Music;
import org.crown.model.parm.MusicPARM;
import org.crown.service.IMusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 音乐表 前端控制器
 * </p>
 *
 * @author Caratacus
 */
@Api(tags = {"music" }, description = "音乐相关接口")
@RestController
@RequestMapping(value = "/music" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Validated
@Slf4j
public class MusicRestController extends SuperController {

    @Autowired
    private IMusicService musicService;

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有音乐(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "MusicName" , value = "需要查询的音乐名" , paramType = "query")
    })
    @GetMapping
    public ApiResponses<IPage<Music>> page(@RequestParam(value = "musicName" , required = false) String musicName,
                                           @RequestParam(value = "author" , required = false) String author) {
        return success(musicService.pageMusic(this.<Music>getPage(), musicName, author));
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有音乐")
    @GetMapping("/musics")
    public ApiResponses<List<Music>> list() {
        return success(musicService.list());
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询单个音乐")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "音乐ID" , required = true, paramType = "path")
    })
    @GetMapping("/{id}")
    public ApiResponses<Music> get(@PathVariable("id") Integer id) {
        Music music = musicService.getById(id);
        return success(music);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "添加音乐")
    @PostMapping
    public ApiResponses<Void> create(@RequestBody @Validated(MusicPARM.Create.class) MusicPARM musicPARM) {
        musicPARM.setStatus(StatusEnum.NORMAL);
        musicService.save(musicPARM.convert(Music.class));
        return success(HttpStatus.CREATED);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "修改音乐")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "音乐ID" , required = true, paramType = "path")
    })
    @PutMapping("/{id}")
    public ApiResponses<Void> update(@PathVariable("id") Integer id, @RequestBody @Validated(MusicPARM.Update.class) MusicPARM musicPARM) {
        Music music = musicPARM.convert(Music.class);
        music.setId(id);
        musicService.updateById(music);
        return success();
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "删除音乐")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "音乐ID" , required = true, paramType = "path")
    })
    @DeleteMapping("/{id}")
    public ApiResponses<Void> delete(@PathVariable("id") Integer id) {
        musicService.removeById(id);
        return success(HttpStatus.NO_CONTENT);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation("设置音乐状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "音乐id" , required = true, paramType = "path")
    })
    @PutMapping("/{id}/status")
    public ApiResponses<Void> updateStatus(@PathVariable("id") Integer id, @RequestBody @Validated(MusicPARM.Status.class) MusicPARM musicPARM) {
        musicService.updateStatus(id, musicPARM.getStatus());
        return success();
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "查询背景音乐")
    @GetMapping("/background")
    public ApiResponses<List<Map<String, String>>> musicList() {
        Page<Music> page = new Page<>();
        page.setSize(10);
        page.setCurrent(1);
        IPage<Music> musicIPage = musicService.pageMusic(page, "" , "");
        List<Music> musicList = musicIPage.getRecords();
        List<Map<String, String>> list = new ArrayList<>();
        if (musicList != null) {
            for (Music music : musicList) {
                Map<String, String> map = new HashMap<>();
                map.put("title" , music.getMusicName());
                map.put("author" , music.getAuthor());
                map.put("pic" , StringUtils.isEmpty(music.getPicUrl()) ? "assets/images/susu.png" : music.getPicUrl());
                map.put("url" , music.getMusicUrl());
                list.add(map);
            }
        }
        return success(list);
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "小程序查询所有音乐(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "musicName" , value = "需要查询的音乐名" , paramType = "query")
    })
    @GetMapping("/wxAppmusic")
    public ApiResponses<IPage<Music>> wxAppMusic(@RequestParam(value = "musicName" , required = false) String musicName,
                                                 @RequestParam(value = "author" , required = false) String author,
                                                 @RequestParam(value = "curpage" , required = false) Integer curpage,
                                                 @RequestParam(value = "rows" , required = false) Integer rows) {
        Page<Music> page = new Page();
        page.setSize(rows);
        page.setCurrent(curpage);
        return success(musicService.pageMusic(page, musicName, author));
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "上传音频")
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
            filePath = "D:/ideaspace/Crown/src/main/resources/static/assets/upload/music/";
            tempUrl = tempUrl + "/assets/upload/music/" + fileName;
        } else {
            filePath = "/usr/local/apache-tomcat-8.5.42/webapps/upload/";
            tempUrl = tempUrl+"/upload/"+fileName;
        }
        File dest = new File(filePath+fileName);
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
    @ApiOperation(value = "上传音乐封面图片")
    @PostMapping("/uploadImg")
    public ApiResponses<String> uploadImg(@RequestParam("file") MultipartFile file) {
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
            filePath = "D:/ideaspace/Crown/src/main/resources/static/assets/upload/photo/";
            tempUrl = tempUrl + "/assets/upload/photo/" + fileName;
        } else {
            filePath = "/usr/local/apache-tomcat-8.5.42/webapps/upload/musicImg/";
            tempUrl = tempUrl+"/upload/musicImg/"+fileName;
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
    @ApiOperation(value = "上传歌词")
    @PostMapping("/uploadLrc")
    public ApiResponses<String> uploadLrc(@RequestParam("file") MultipartFile file) {
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
            filePath = "D:/ideaspace/Crown/src/main/resources/static/assets/upload/music/";
            tempUrl = tempUrl + "/assets/upload/music/" + fileName;
        } else {
            filePath = "/usr/local/apache-tomcat-8.5.42/webapps/upload/lrc/";
            tempUrl = tempUrl+"/upload/lrc/"+fileName;
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
}

