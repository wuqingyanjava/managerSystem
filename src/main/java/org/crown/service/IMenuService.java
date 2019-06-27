
package org.crown.service;

import java.util.List;
import java.util.Set;

import org.crown.enums.StatusEnum;
import org.crown.framework.service.BaseService;
import org.crown.model.dto.MenuDTO;
import org.crown.model.dto.MenuTreeDTO;
import org.crown.model.entity.Menu;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author Caratacus
 */
public interface IMenuService extends BaseService<Menu> {

    /**
     * 保存菜单
     *
     * @param menu
     * @param resourceIds
     */
    void saveMenu(Menu menu, List<String> resourceIds);

    /**
     * 修改菜单
     *
     * @param menu
     * @param resourceIds
     */
    void updateMenu(Menu menu, List<String> resourceIds);

    /**
     * 递归删除菜单
     *
     * @param menuId
     */
    void removeMenu(Integer menuId);

    /**
     * 修改菜单状态
     *
     * @param menuId
     * @param status
     */
    void updateStatus(Integer menuId, StatusEnum status);

    /**
     * 获取菜单详情
     *
     * @param menuId
     * @return
     */
    MenuDTO getMenuDTODetails(Integer menuId);

    /**
     * 获取用户权限菜单
     *
     * @param uid
     * @return
     */
    List<MenuTreeDTO> getUserPermMenus(Integer uid);

    /**
     * 获取用户按钮权限
     *
     * @param uid
     * @return
     */
    Set<String> getUserPermButtonAliases(Integer uid);

}
