
package org.crown.model.parm;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.convert.Convert;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * <p>
 * 广告表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class AdvertPARM extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 广告名称
     */
    @NotNull(groups = AdvertPARM.Create.class, message = "广告名称不能为空")
    private String advertName;

    /**
     * 广告链接
     */
    private String linkUrl;

    /**
     * 图片地址
     */
    private String picUrl;

    /**
     * 状态 0：禁用 1：正常
     */
    @NotNull(groups = {AdvertPARM.Status.class}, message = "状态不能为空")
    private StatusEnum status;

    public interface Create {

    }

    public interface Update {

    }

    public interface Status {

    }
}
