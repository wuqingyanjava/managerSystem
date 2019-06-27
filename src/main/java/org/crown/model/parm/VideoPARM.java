
package org.crown.model.parm;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.convert.Convert;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 视频表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class VideoPARM extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 视频名称
     */
    @NotNull(groups = VideoPARM.Create.class, message = "视频名称不能为空")
    private String videoName;

    /**
     * 视频链接
     */
    @NotNull(groups = VideoPARM.Create.class, message = "视频链接不能为空")
    private String videoUrl;

    /**
     * 视频来源
     */
    private String source;

    /**
     * 状态 0：禁用 1：正常
     */
    @NotNull(groups = {VideoPARM.Status.class}, message = "状态不能为空")
    private StatusEnum status;

    public interface Create {

    }

    public interface Update {

    }

    public interface Status {

    }
}
