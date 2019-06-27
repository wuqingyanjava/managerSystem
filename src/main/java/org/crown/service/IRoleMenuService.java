
package org.crown.service;

import java.util.List;

import org.crown.framework.service.BaseService;
import org.crown.model.entity.RoleMenu;

/**
 * <p>
 * 角色菜单关系表 服务类
 * </p>
 *
 * @author Caratacus
 */
public interface IRoleMenuService extends BaseService<RoleMenu> {

    /**
     * 保存角色菜单关系
     *
     * @param roleId
     * @param menuIds
     */
    void saveRoleMenu(Integer roleId, List<Integer> menuIds);
}
