
package org.crown.service;

import org.crown.framework.service.BaseService;
import org.crown.model.dto.RoleDTO;
import org.crown.model.entity.Role;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author Caratacus
 */
public interface IRoleService extends BaseService<Role> {

    /**
     * 获取角色详情列表
     *
     * @param page
     * @param roleName
     * @return
     */
    IPage<RoleDTO> pageRoleDTO(Page<Role> page, String roleName);
}
