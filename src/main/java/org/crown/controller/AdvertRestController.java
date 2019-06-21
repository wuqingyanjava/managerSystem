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

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.crown.common.annotations.Resources;
import org.crown.enums.AuthTypeEnum;
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

import java.util.List;

/**
 * <p>
 * 广告表 前端控制器
 * </p>
 *
 * @author Caratacus
 */
@Api(tags = {"Advert"}, description = "广告相关接口")
@RestController
@RequestMapping(value = "/advert", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Validated
public class AdvertRestController extends SuperController {

    @Autowired
    private IAdvertService advertService;

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有广告")
    @GetMapping
    public ApiResponses<List<Advert>> list() {
        return success(advertService.list());
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询单个广告")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "广告ID", required = true, paramType = "path")
    })
    @GetMapping("/{id}")
    public ApiResponses<Advert> get(@PathVariable("id") String id) {
        return success(advertService.getById(id));
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "添加广告")
    @PostMapping
    public ApiResponses<Void> create(@RequestBody @Validated(AdvertPARM.Create.class) AdvertPARM advertPARM) {
        Advert advert = advertPARM.convert(Advert.class);
        advertService.save(advert);
        return success(HttpStatus.CREATED);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "修改广告")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "广告ID", required = true, paramType = "path")
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
            @ApiImplicitParam(name = "id", value = "广告ID", required = true, paramType = "path")
    })
    @DeleteMapping("/{id}")
    public ApiResponses<Void> delete(@PathVariable("id") String id) {
        advertService.removeById(id);
        return success(HttpStatus.NO_CONTENT);
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation("设置广告状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "广告ID", required = true, paramType = "path")
    })
    @PutMapping("/{id}/status")
    public ApiResponses<Void> updateStatus(@PathVariable("id") Integer id, @RequestBody @Validated(AdvertPARM.Status.class) AdvertPARM advertPARM) {
        //advertService.updateStatus(id, advertPARM.getStatus());
        return success();
    }

}

