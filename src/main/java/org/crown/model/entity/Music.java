
package org.crown.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.BaseModel;
import org.crown.framework.model.convert.Convert;

import java.time.LocalDateTime;

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
@TableName("t_music")
public class Music extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id" , type = IdType.AUTO)
    private Integer id;
    /**
     * 音乐名称
     */
    private String musicName;

    /**
     * 作者
     */
    private String author;

    /**
     * 音乐地址
     */
    private String picUrl;

    /**
     * 音乐地址
     */
    private String musicUrl;

    /**
     * 状态 0：禁用 1：正常
     */
    private StatusEnum status;
    /**
     * 创建者ID
     */
    @TableField(fill = FieldFill.INSERT)
    private Integer createUid;

    /**
     * 修改者ID
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Integer updateUid;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 歌词
     */
//    private String lrc;
}
