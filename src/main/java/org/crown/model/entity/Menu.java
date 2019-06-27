
package org.crown.model.entity;

import java.time.LocalDateTime;

import org.crown.enums.MenuTypeEnum;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.BaseModel;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("sys_menu")
public class Menu extends BaseModel {

    private static final long serialVersionUID = 1L;

    /**
     * 父菜单ID，一级菜单为0
     */
    private Integer parentId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 路径
     */
    private String path;

    /**
     * 路由
     */
    private String router;

    /**
     * 类型:1:目录,2:菜单,3:按钮
     */
    private MenuTypeEnum menuType;

    /**
     * 排序号
     */
    private Integer snNum;
    /**
     * 菜单图标
     */
    private String icon;
    /**
     * 别名
     */
    private String alias;
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
