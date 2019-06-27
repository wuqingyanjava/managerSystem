
package org.crown.model.entity;

import org.crown.framework.model.BaseModel;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 菜单资源关系表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("sys_menu_resource")
public class MenuResource extends BaseModel {

    private static final long serialVersionUID = 1L;

    public MenuResource(Integer menuId, String resourceId) {
        this.menuId = menuId;
        this.resourceId = resourceId;
    }

    /**
     * 菜单ID
     */
    private Integer menuId;

    /**
     * 资源ID
     */
    private String resourceId;


}
