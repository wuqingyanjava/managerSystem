
package org.crown.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.crown.enums.StatusEnum;
import org.crown.framework.service.BaseService;
import org.crown.model.entity.Advert;

/**
 * <p>
 * 广告表 服务类
 * </p>
 *
 * @author Caratacus
 */
public interface IAdvertService extends BaseService<Advert> {

    IPage<Advert> pageAdvert(Page<Advert> page, String advertName);

    void updateStatus(Integer id, StatusEnum status);

}
