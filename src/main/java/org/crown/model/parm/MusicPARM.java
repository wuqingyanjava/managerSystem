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

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.convert.Convert;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 音乐表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class MusicPARM extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 音乐名称
     */
    @NotNull(groups = MusicPARM.Create.class, message = "音乐名称不能为空")
    private String musicName;

    private String picUrl;
    /**
     * 音乐链接
     */
    @NotNull(groups = MusicPARM.Create.class, message = "音乐链接不能为空")
    private String musicUrl;

    /**
     * 作者
     */
    private String author;

    /**
     * 状态 0：禁用 1：正常
     */
    @NotNull(groups = {MusicPARM.Status.class}, message = "状态不能为空")
    private StatusEnum status;

    public interface Create {

    }

    public interface Update {

    }

    public interface Status {

    }
}
