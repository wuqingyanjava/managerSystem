
package org.crown.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.crown.common.annotations.Resources;
import org.crown.common.utils.ApiUtils;
import org.crown.enums.AuthTypeEnum;
import org.crown.enums.StatusEnum;
import org.crown.framework.controller.SuperController;
import org.crown.framework.responses.ApiResponses;
import org.crown.model.entity.Article;
import org.crown.model.entity.User;
import org.crown.model.parm.ArticlePARM;
import org.crown.service.IArticleService;
import org.crown.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 文章表 前端控制器
 * </p>
 *
 * @author Caratacus
 */
@Api(tags = {"article" }, description = "文章相关接口")
@RestController
@RequestMapping(value = "/article" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Validated
@Slf4j
public class ArticleRestController extends SuperController {

    @Autowired
    private IArticleService articleService;
    @Autowired
    private IUserService userService;

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有文章(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "articleName" , value = "需要查询的文章名" , paramType = "query")
    })
    @GetMapping
    public ApiResponses<IPage<Article>> page(@RequestParam(value = "articleName" , required = false) String articleName
    ) {
        return success(articleService.pageArticle(this.<Article>getPage(), articleName));
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有文章")
    @GetMapping("/articles")
    public ApiResponses<List<Article>> list() {
        return success(articleService.list());
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询单个文章")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "文章ID" , required = true, paramType = "path")
    })
    @GetMapping("/{id}")
    public ApiResponses<Article> get(@PathVariable("id") Integer id) {
        Article article = articleService.getById(id);
        return success(article);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "添加文章")
    @PostMapping
    public ApiResponses<Void> create(@RequestBody @Validated(ArticlePARM.Create.class) ArticlePARM articlePARM) {
        articlePARM.setStatus(StatusEnum.NORMAL);
        int uid = ApiUtils.currentUid();
        User user = userService.getById(uid);
        articlePARM.setAuthor(user.getNickname());
        articleService.save(articlePARM.convert(Article.class));
        return success(HttpStatus.CREATED);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "修改文章")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "文章ID" , required = true, paramType = "path")
    })
    @PutMapping("/{id}")
    public ApiResponses<Void> update(@PathVariable("id") Integer id, @RequestBody @Validated(ArticlePARM.Update.class) ArticlePARM articlePARM) {
        Article article = articlePARM.convert(Article.class);
        article.setId(id);
        articleService.updateById(article);
        return success();
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "删除文章")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "文章ID" , required = true, paramType = "path")
    })
    @DeleteMapping("/{id}")
    public ApiResponses<Void> delete(@PathVariable("id") Integer id) {
        articleService.removeById(id);
        return success(HttpStatus.NO_CONTENT);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation("设置文章状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "文章id" , required = true, paramType = "path")
    })
    @PutMapping("/{id}/status")
    public ApiResponses<Void> updateStatus(@PathVariable("id") Integer id, @RequestBody @Validated(ArticlePARM.Status.class) ArticlePARM articlePARM) {
        articleService.updateStatus(id, articlePARM.getStatus());
        return success();
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "上传图片")
    @PostMapping("/upload")
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file) {
        Map<String, Object> bakcMap = new HashMap<>();
        if (file.isEmpty()) {
            bakcMap.put("code" , -1);
            bakcMap.put("msg" , "上传失败，文件为空");
            return bakcMap;
        }
        String tempUrl = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort();
//        request.getScheme() = "http";
//        request.getServerName() = "127.0.0.1";
//        request.getServerPort() = "8080";
        String tempName = file.getOriginalFilename();
        String suffix = tempName.substring(tempName.lastIndexOf(".") + 1);
        String fileName = System.currentTimeMillis() + "." + suffix;
        String os = System.getProperty("os.name");
        String filePath = "";
        if (os.toLowerCase().startsWith("win")) {
            filePath = "D:/ideaspace/Crown/src/main/resources/static/assets/upload/";
        } else {
            filePath = "/usr/local/apache-tomcat-8.5.42/webapps/crown/WEB-INF/classes/static/assets/upload/";
        }
        File dest = new File(filePath + fileName);
        try {
            file.transferTo(dest);
            log.info("上传成功");
            bakcMap.put("code" , 0);
            Map<String, String> datamap = new HashMap<>();
            datamap.put("src" , tempUrl + "/assets/upload/" + fileName);
            bakcMap.put("data" , datamap);
            return bakcMap;
        } catch (IOException e) {
            log.error(e.toString(), e);
            bakcMap.put("code" , -1);
            bakcMap.put("msg" , "上传失败，出现异常");
            return bakcMap;
        }
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "小程序查询所有文章(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "articleName" , value = "需要查询的文章名" , paramType = "query")
    })
    @GetMapping("/wxAppArticle")
    public ApiResponses<IPage<Article>> wxApparticle(@RequestParam(value = "articleName" , required = false) String articleName,
                                                     @RequestParam(value = "author" , required = false) String author,
                                                     @RequestParam(value = "curpage" , required = false) Integer curpage,
                                                     @RequestParam(value = "rows" , required = false) Integer rows) {
        Page<Article> page = new Page();
        page.setSize(rows);
        page.setCurrent(curpage);
        return success(articleService.pageArticle(page, articleName));
    }
}

