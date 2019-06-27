
package org.crown.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.crown.enums.StatusEnum;
import org.crown.framework.service.BaseService;
import org.crown.model.entity.Video;

/**
 * <p>
 * 视频表 服务类
 * </p>
 *
 * @author Caratacus
 */
public interface IVideoService extends BaseService<Video> {
    /**
     * 分页查询视频列表
     */
    IPage<Video> pageVideo(Page<Video> page, String videoName);

    void updateStatus(Integer id, StatusEnum status);
}
