
package org.crown.model.parm;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.convert.Convert;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 文章表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ArticlePARM extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 文章名称
     */
    @NotNull(groups = ArticlePARM.Create.class, message = "文章名称不能为空")
    private String articleName;

    /**
     * 文章链接
     */
    @NotNull(groups = ArticlePARM.Create.class, message = "文章内容不能为空")
    private String content;

    /**
     * 作者
     */
    private String author;


    /**
     * 类型
     */
    private Integer type;

    /**
     * 状态 0：禁用 1：正常
     */
    @NotNull(groups = {ArticlePARM.Status.class}, message = "状态不能为空")
    private StatusEnum status;

    public interface Create {

    }

    public interface Update {

    }

    public interface Status {

    }
}
