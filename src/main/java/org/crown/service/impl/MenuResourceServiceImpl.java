
package org.crown.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.crown.framework.service.impl.BaseServiceImpl;
import org.crown.mapper.MenuResourceMapper;
import org.crown.model.entity.MenuResource;
import org.crown.service.IMenuResourceService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 菜单资源关系表 服务实现类
 * </p>
 *
 * @author Caratacus
 */
@Service
public class MenuResourceServiceImpl extends BaseServiceImpl<MenuResourceMapper, MenuResource> implements IMenuResourceService {

    @Override
    public void removeByMenuId(Integer menuId) {
        delete().eq(MenuResource::getMenuId, menuId).execute();
    }

    @Override
    public List<MenuResource> getMenuResources(Integer menuId, List<String> resourceIds) {
        return resourceIds.stream().map(resourceId -> new MenuResource(menuId, resourceId)).collect(Collectors.toList());
    }

}
