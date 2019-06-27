
package org.crown.service.impl;

import org.crown.common.utils.TypeUtils;
import org.crown.framework.service.impl.BaseServiceImpl;
import org.crown.mapper.RoleMapper;
import org.crown.model.dto.RoleDTO;
import org.crown.model.entity.Role;
import org.crown.model.entity.RoleMenu;
import org.crown.service.IRoleMenuService;
import org.crown.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author Caratacus
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements IRoleService {

    @Autowired
    private IRoleMenuService roleMenuService;

    @Override
    public IPage<RoleDTO> pageRoleDTO(Page<Role> page, String roleName) {
        IPage<Role> rolePage = query().like(StringUtils.isNotEmpty(roleName), Role::getRoleName, roleName).page(page);
        return rolePage.convert(role -> {
            RoleDTO roleDTO = role.convert(RoleDTO.class);
            roleDTO.setMenuIds(roleMenuService.query()
                    .select(RoleMenu::getMenuId)
                    .eq(RoleMenu::getRoleId, role.getId())
                    .listObjs(TypeUtils::castToInt)
            );
            return roleDTO;
        });
    }
}
