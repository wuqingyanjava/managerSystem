
package org.crown.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.crown.enums.MenuTypeEnum;
import org.crown.enums.StatusEnum;
import org.crown.framework.mapper.BaseMapper;
import org.crown.model.dto.MenuTreeDTO;
import org.crown.model.entity.Menu;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author Caratacus
 */
@Mapper
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 获取用户权限菜单
     *
     * @param uid
     * @param statusType
     * @param menuTypes
     * @return
     */
    List<MenuTreeDTO> getUserPermMenus(@Param("uid") Integer uid, @Param("statusType") StatusEnum statusType, @Param("menuTypes") List<MenuTypeEnum> menuTypes);
}
