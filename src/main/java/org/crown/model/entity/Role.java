
package org.crown.model.entity;

import java.time.LocalDateTime;

import org.crown.framework.model.BaseModel;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("sys_role")
public class Role extends BaseModel {

    private static final long serialVersionUID = 1L;

    /**
     * 角色名称
     */
    private String roleName;

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
     * 备注
     */
    private String remark;

}
