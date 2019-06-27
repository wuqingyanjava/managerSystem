
package org.crown.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.crown.framework.mapper.BaseMapper;
import org.crown.model.dto.ResourcePermDTO;
import org.crown.model.entity.Resource;

/**
 * <p>
 * 资源表 Mapper 接口
 * </p>
 *
 * @author Caratacus
 */
@Mapper
public interface ResourceMapper extends BaseMapper<Resource> {

    /**
     * 获取用户权限
     *
     * @param uid
     * @return
     */
    List<ResourcePermDTO> getUserResourcePerms(@Param("uid") Integer uid);

    /**
     * 获取用户菜单资源权限
     *
     * @param uid
     * @return
     */
    List<ResourcePermDTO> getUserMenuResourcePerms(@Param("uid") Integer uid);
}
