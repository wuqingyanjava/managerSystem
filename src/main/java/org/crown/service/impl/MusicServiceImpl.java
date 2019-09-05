
package org.crown.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.crown.enums.StatusEnum;
import org.crown.framework.enums.ErrorCodeEnum;
import org.crown.framework.service.impl.BaseServiceImpl;
import org.crown.framework.utils.ApiAssert;
import org.crown.mapper.MusicMapper;
import org.crown.model.entity.Music;
import org.crown.service.IMusicService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 音乐表 服务实现类
 * </p>
 *
 * @author Caratacus
 */
@Service
public class MusicServiceImpl extends BaseServiceImpl<MusicMapper, Music> implements IMusicService {

    @Override
    public IPage<Music> pageMusic(Page<Music> page, String musicName, String author) {
        IPage<Music> musicPage = query().like(StringUtils.isNotEmpty(musicName), Music::getMusicName, musicName)
                .like(StringUtils.isNotEmpty(author), Music::getAuthor, author).page(page);
        return musicPage;
    }

    @Override
    @Transactional
    public void updateStatus(Integer id, StatusEnum status) {
        Music music = getById(id);
        ApiAssert.notNull(ErrorCodeEnum.ENTITY_NOT_FOUND, music);
        music.setStatus(status);
        updateById(music);
    }

}
