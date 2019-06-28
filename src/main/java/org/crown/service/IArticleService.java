
package org.crown.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.crown.enums.StatusEnum;
import org.crown.framework.service.BaseService;
import org.crown.model.entity.Article;


/**
 * <p>
 * 文章表 服务类
 * </p>
 **/
public interface IArticleService extends BaseService<Article> {
    /**
     * 分页查询文章列表
     */
    IPage<Article> pageArticle(Page<Article> page, String articleName);

    void updateStatus(Integer id, StatusEnum status);
}
