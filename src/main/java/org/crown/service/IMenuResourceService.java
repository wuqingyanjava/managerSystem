
package org.crown.service;

import java.util.List;

import org.crown.framework.service.BaseService;
import org.crown.model.entity.MenuResource;

/**
 * <p>
 * 菜单资源关系表 服务类
 * </p>
 *
 * @author Caratacus
 */
public interface IMenuResourceService extends BaseService<MenuResource> {

    /**
     * 根据菜单ID删除资源关系记录
     *
     * @param menuId
     */
    void removeByMenuId(Integer menuId);

    /**
     * 获取菜单资源关系
     *
     * @param menuId
     * @param resourceIds
     */
    List<MenuResource> getMenuResources(Integer menuId, List<String> resourceIds);

}
