
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
     * 歌词url
     */
    private String lrc;

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
