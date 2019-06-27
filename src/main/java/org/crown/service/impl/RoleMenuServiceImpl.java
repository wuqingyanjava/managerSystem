
package org.crown.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.crown.framework.service.impl.BaseServiceImpl;
import org.crown.mapper.RoleMenuMapper;
import org.crown.model.entity.RoleMenu;
import org.crown.service.IRoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 角色菜单关系表 服务实现类
 * </p>
 *
 * @author Caratacus
 */
@Service
public class RoleMenuServiceImpl extends BaseServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {

    @Override
    @Transactional
    public void saveRoleMenu(Integer roleId, List<Integer> menuIds) {
        delete().eq(RoleMenu::getRoleId, roleId).execute();
        saveBatch(menuIds.stream().map(menuId -> new RoleMenu(roleId, menuId)).collect(Collectors.toList()));
    }
}
