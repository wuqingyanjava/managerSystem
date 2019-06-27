
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
