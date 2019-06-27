
package org.crown.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.crown.enums.StatusEnum;
import org.crown.framework.enums.ErrorCodeEnum;
import org.crown.framework.service.impl.BaseServiceImpl;
import org.crown.framework.utils.ApiAssert;
import org.crown.mapper.MusicMapper;
import org.crown.mapper.VideoMapper;
import org.crown.model.entity.Music;
import org.crown.model.entity.Video;
import org.crown.service.IMusicService;
import org.crown.service.IVideoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 视频表 服务实现类
 * </p>
 *
 * @author Caratacus
 */
@Service
public class VideoServiceImpl extends BaseServiceImpl<VideoMapper, Video> implements IVideoService {

    @Override
    public IPage<Video> pageVideo(Page<Video> page, String videoName) {
        IPage<Video> videoPage = query().like(StringUtils.isNotEmpty(videoName), Video::getVideoName, videoName)
                .page(page);
        return videoPage;
    }

    @Override
    @Transactional
    public void updateStatus(Integer id, StatusEnum status) {
        Video video = getById(id);
        ApiAssert.notNull(ErrorCodeEnum.ENTITY_NOT_FOUND, video);
        video.setStatus(status);
        updateById(video);
    }

}
