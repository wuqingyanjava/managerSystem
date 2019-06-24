/*
 * Copyright (c) 2018-2022 Caratacus, (caratacus@qq.com).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package org.crown.controller;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
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
@Api(tags = {"music"}, description = "音乐相关接口")
@RestController
@RequestMapping(value = "/music", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Validated
public class MusicRestController extends SuperController {

    @Autowired
    private IMusicService musicService;

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有音乐(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "MusicName", value = "需要查询的音乐名", paramType = "query")
    })
    @GetMapping
    public ApiResponses<IPage<Music>> page(@RequestParam(value = "musicName", required = false) String musicName,
                                           @RequestParam(value = "author", required = false) String author) {
        return success(musicService.pageMusic(this.<Music>getPage(), musicName,author));
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
            @ApiImplicitParam(name = "id", value = "音乐ID", required = true, paramType = "path")
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
            @ApiImplicitParam(name = "id", value = "音乐ID", required = true, paramType = "path")
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
            @ApiImplicitParam(name = "id", value = "音乐ID", required = true, paramType = "path")
    })
    @DeleteMapping("/{id}")
    public ApiResponses<Void> delete(@PathVariable("id") Integer id) {
        musicService.removeById(id);
        return success(HttpStatus.NO_CONTENT);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation("设置音乐状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "音乐id", required = true, paramType = "path")
    })
    @PutMapping("/{id}/status")
    public ApiResponses<Void> updateStatus(@PathVariable("id") Integer id, @RequestBody @Validated(MusicPARM.Status.class) MusicPARM musicPARM) {
        musicService.updateStatus(id, musicPARM.getStatus());
        return success();
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "查询背景音乐")
    @GetMapping("/background")
    public ApiResponses<List<Map<String,String>>> musicList() {
        List<Map<String,String>> list = new ArrayList<>();
        Map<String,String> map1 = new HashMap<>();
        map1.put("title","倒带");
        map1.put("author","蔡依林");
        map1.put("pic","http://y.gtimg.cn/music/photo_new/T002R300x300M0000022ANm11dQfRY.jpg");
        map1.put("url","http://dl.stream.qqmusic.qq.com/M500004IM0wx49gYJq.mp3?vkey=50A3B875C43DB5ACBC4CF612F2D00732AF35C17AD18491480AD5CF92C3BE3092C4C6214B8BA6AB48F501E9553DCA0D23A83441793839D761&guid=5150825362&fromtag=1");
        Map<String,String> map2 = new HashMap<>();
        map2.put("title","回到过去");
        map2.put("author","周杰伦");
        map2.put("pic","http://y.gtimg.cn/music/photo_new/T002R300x300M000004MGitN0zEHpb.jpg");
        map2.put("url","http://dl.stream.qqmusic.qq.com/M500003rxgIM2eOFSF.mp3?vkey=06AF977883F0D805B508EA5B8B6F40EB263583638C3C7018CF29521D3618E0D4702C2414E1B07960E2F2195F6D8634AADA0F474957995DFD&guid=5150825362&fromtag=1");
        list.add(map2);
        list.add(map1);
        return success(list);
    }
}

