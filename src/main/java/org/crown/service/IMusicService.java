
package org.crown.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.crown.enums.StatusEnum;
import org.crown.framework.service.BaseService;
import org.crown.model.entity.Music;

/**
 * <p>
 * 音乐表 服务类
 * </p>
 *
 * @author Caratacus
 */
public interface IMusicService extends BaseService<Music> {
    /**
     * 分页查询音乐列表
     */
    IPage<Music> pageMusic(Page<Music> page, String musicName, String author);

    void updateStatus(Integer id, StatusEnum status);
}
