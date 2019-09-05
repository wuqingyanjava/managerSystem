
package org.crown.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.crown.common.annotations.Resources;
import org.crown.enums.AuthTypeEnum;
import org.crown.enums.StatusEnum;
import org.crown.framework.controller.SuperController;
import org.crown.framework.responses.ApiResponses;
import org.crown.model.entity.Video;
import org.crown.model.parm.VideoPARM;
import org.crown.service.IVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 视频表 前端控制器
 * </p>
 *
 * @author Caratacus
 */
@Api(tags = {"video" }, description = "视频相关接口")
@RestController
@RequestMapping(value = "/video" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Validated
public class VideoRestController extends SuperController {

    @Autowired
    private IVideoService videoService;

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有视频(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "videoName" , value = "需要查询的视频名" , paramType = "query")
    })
    @GetMapping
    public ApiResponses<IPage<Video>> page(@RequestParam(value = "videoName" , required = false) String videoName
    ) {
        return success(videoService.pageVideo(this.<Video>getPage(), videoName));
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有视频")
    @GetMapping("/videos")
    public ApiResponses<List<Video>> list() {
        return success(videoService.list());
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询单个视频")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "视频ID" , required = true, paramType = "path")
    })
    @GetMapping("/{id}")
    public ApiResponses<Video> get(@PathVariable("id") Integer id) {
        Video video = videoService.getById(id);
        return success(video);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "添加视频")
    @PostMapping
    public ApiResponses<Void> create(@RequestBody @Validated(VideoPARM.Create.class) VideoPARM videoPARM) {
        videoPARM.setStatus(StatusEnum.NORMAL);
        videoService.save(videoPARM.convert(Video.class));
        return success(HttpStatus.CREATED);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "修改视频")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "视频ID" , required = true, paramType = "path")
    })
    @PutMapping("/{id}")
    public ApiResponses<Void> update(@PathVariable("id") Integer id, @RequestBody @Validated(VideoPARM.Update.class) VideoPARM videoPARM) {
        Video video = videoPARM.convert(Video.class);
        video.setId(id);
        videoService.updateById(video);
        return success();
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "删除视频")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "视频ID" , required = true, paramType = "path")
    })
    @DeleteMapping("/{id}")
    public ApiResponses<Void> delete(@PathVariable("id") Integer id) {
        videoService.removeById(id);
        return success(HttpStatus.NO_CONTENT);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation("设置视频状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "视频id" , required = true, paramType = "path")
    })
    @PutMapping("/{id}/status")
    public ApiResponses<Void> updateStatus(@PathVariable("id") Integer id, @RequestBody @Validated(VideoPARM.Status.class) VideoPARM videoPARM) {
        videoService.updateStatus(id, videoPARM.getStatus());
        return success();
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "小程序查询所有视频(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "videoName" , value = "需要查询的视频名" , paramType = "query")
    })
    @GetMapping("/wxAppVideo")
    public ApiResponses<IPage<Video>> wxAppVideo(@RequestParam(value = "VideoName" , required = false) String videoName,
                                                 @RequestParam(value = "curpage" , required = false) Integer curpage,
                                                 @RequestParam(value = "rows" , required = false) Integer rows) {
        Page<Video> page = new Page();
        page.setSize(rows);
        page.setCurrent(curpage);
        return success(videoService.pageVideo(page, videoName));
    }
}

