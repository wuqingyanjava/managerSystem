/*
 * Copyright (c) 2018-2022 Caratacus, (caratacus@qq.com).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
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
    public IPage<Music> pageMusic(Page<Music> page, String musicName,String author) {
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
