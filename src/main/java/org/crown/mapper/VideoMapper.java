
package org.crown.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.crown.framework.mapper.BaseMapper;
import org.crown.model.entity.Video;

/**
 * <p>
 * 视频表 Mapper 接口
 * </p>
 *
 * @author Caratacus
 */
@Mapper
public interface VideoMapper extends BaseMapper<Video> {
}
