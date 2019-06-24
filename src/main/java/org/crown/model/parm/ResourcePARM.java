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
package org.crown.model.parm;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.AuthTypeEnum;
import org.crown.framework.model.convert.Convert;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * <p>
 * 资源表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ResourcePARM extends Convert {

    private static final long serialVersionUID = 1L;


    /**
     * 资源名称
     */
    @NotNull(groups = ResourcePARM.Create.class, message = "资源名称不能为空")
    @ApiModelProperty(notes = "资源名称")
    private String resourceName;

    /**
     * 路径映射
     */
    @NotNull(groups = ResourcePARM.Create.class, message = "路径映射不能为空")
    @ApiModelProperty(notes = "路径映射")
    private String mapping;

    /**
     * 请求方式
     */
    @NotNull(groups = ResourcePARM.Create.class, message = "请求方式不能为空")
    @ApiModelProperty(notes = "请求方式")
    private String method;

    /**
     * 权限认证类型
     */
    @NotNull(groups = ResourcePARM.Create.class, message = "权限认证类型不能为空")
    @ApiModelProperty(notes = "权限认证类型")
    private AuthTypeEnum authType;
    /**
     * 权限标识
     */
    @ApiModelProperty(notes = "权限标识")
    private String perm;

    public interface Create {

    }

    public interface Update {

    }

    public interface Status {

    }

}