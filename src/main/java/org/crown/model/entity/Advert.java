
package org.crown.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.convert.Convert;

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
@TableName("t_advert")
public class Advert extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 广告名称
     */
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
}
