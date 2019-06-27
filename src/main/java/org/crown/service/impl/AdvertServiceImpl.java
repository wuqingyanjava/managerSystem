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
import org.crown.mapper.AdvertMapper;
import org.crown.model.entity.Advert;
import org.crown.service.IAdvertService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 广告表 服务实现类
 * </p>
 *
 * @author Caratacus
 */
@Service
public class AdvertServiceImpl extends BaseServiceImpl<AdvertMapper, Advert> implements IAdvertService {

    @Override
    public IPage<Advert> pageAdvert(Page<Advert> page, String advertName) {
        IPage<Advert> advertPage = query().like(StringUtils.isNotEmpty(advertName), Advert::getAdvertName, advertName)
                .page(page);
        return advertPage;
    }

    @Override
    @Transactional
    public void updateStatus(Integer id, StatusEnum status) {
        Advert advert = getById(id);
        ApiAssert.notNull(ErrorCodeEnum.ENTITY_NOT_FOUND, advert);
        advert.setStatus(status);
        boolean b = updateById(advert);
    }

}
