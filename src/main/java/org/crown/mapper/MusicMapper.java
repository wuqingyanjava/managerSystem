
package org.crown.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.crown.framework.mapper.BaseMapper;
import org.crown.model.entity.Music;

/**
 * <p>
 * 音乐表 Mapper 接口
 * </p>
 *
 * @author Caratacus
 */
@Mapper
public interface MusicMapper extends BaseMapper<Music> {
}
