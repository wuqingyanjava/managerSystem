
package org.crown.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.crown.framework.mapper.BaseMapper;
import org.crown.model.entity.User;

/**
 * <p>
 * 系统用户表 Mapper 接口
 * </p>
 *
 * @author Caratacus
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

}
