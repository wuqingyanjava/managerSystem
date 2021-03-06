
package org.crown.controller;

import java.util.List;
import java.util.Objects;
import java.util.UUID;

import org.crown.common.annotations.Resources;
import org.crown.enums.AuthTypeEnum;
import org.crown.framework.controller.SuperController;
import org.crown.framework.responses.ApiResponses;
import org.crown.model.dto.ResourceDTO;
import org.crown.model.entity.Resource;
import org.crown.model.parm.ResourcePARM;
import org.crown.service.IResourceService;
import org.crown.service.ScanMappings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

/**
 * <p>
 * 资源表 前端控制器
 * </p>
 *
 * @author Caratacus
 */
@Api(tags = {"Resource" }, description = "资源操作相关接口")
@RestController
@RequestMapping(value = "/resources" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@Validated
public class ResourceRestController extends SuperController {

    @Autowired
    private IResourceService resourceService;

    @Autowired
    private ScanMappings scanMappings;

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有资源(分页)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "resourceName" , value = "需要查询的资源名" , paramType = "query"),
            @ApiImplicitParam(name = "method" , value = "需要查询的请求方式" , paramType = "query"),
            @ApiImplicitParam(name = "authType" , value = "权限认证类型" , paramType = "query")
    })
    @GetMapping
    public ApiResponses<IPage<Resource>> page(@RequestParam(value = "resourceName" , required = false) String resourceName,
                                              @RequestParam(value = "method" , required = false) String method,
                                              @RequestParam(value = "authType" , required = false) AuthTypeEnum authType
    ) {
        return success(
                resourceService.query()
                        .like(StringUtils.isNotEmpty(resourceName), Resource::getResourceName, resourceName)
                        .eq(StringUtils.isNotEmpty(method), Resource::getMethod, method)
                        .eq(Objects.nonNull(authType), Resource::getAuthType, authType)
                        .page(this.<Resource>getPage())
        );
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "查询所有资源")
    @GetMapping("/resources")
    public ApiResponses<List<Resource>> list() {
        return success(resourceService.list());
    }

    @Resources(auth = AuthTypeEnum.AUTH)
    @ApiOperation(value = "刷新资源")
    @PutMapping
    public ApiResponses<Void> refresh() {
        scanMappings.doScan();
        return success();
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "添加资源")
    @PostMapping("/create")
    public ApiResponses<Void> create(@RequestBody @Validated(ResourcePARM.Create.class) ResourcePARM resourcePARM) {
        Resource resource = resourcePARM.convert(Resource.class);
        String id = UUID.randomUUID().toString();
        //替换uuid中的"-"
        id = id.replace("-" , "");
        resource.setId(id);
        resource.setPerm(resource.getMethod() + ":" + resource.getMapping());
        resourceService.save(resource);
        return success(HttpStatus.CREATED);
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "查询单个资源")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "资源ID" , required = true, paramType = "path")
    })
    @GetMapping("/{id}")
    public ApiResponses<ResourceDTO> get(@PathVariable("id") String id) {
        return success(resourceService.getById(id).convert(ResourceDTO.class));
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "删除资源")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "资源ID" , required = true, paramType = "path")
    })
    @DeleteMapping("/{id}")
    public ApiResponses<Void> delete(@PathVariable("id") String id) {
        resourceService.removeById(id);
        return success(HttpStatus.NO_CONTENT);
    }

    @Resources(auth = AuthTypeEnum.OPEN)
    @ApiOperation(value = "修改资源")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id" , value = "资源ID" , required = true, paramType = "path")
    })
    @PutMapping("/{id}")
    public ApiResponses<Void> update(@PathVariable("id") String id, @RequestBody @Validated(ResourcePARM.Update.class) ResourcePARM resourcePARM) {
        Resource resource = resourcePARM.convert(Resource.class);
        resource.setId(id);
        resource.setPerm(resource.getMethod() + ":" + resource.getMapping());
        resourceService.updateById(resource);
        return success();
    }

}

