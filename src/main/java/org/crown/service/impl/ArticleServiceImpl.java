
package org.crown.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.crown.enums.StatusEnum;
import org.crown.framework.enums.ErrorCodeEnum;
import org.crown.framework.service.impl.BaseServiceImpl;
import org.crown.framework.utils.ApiAssert;
import org.crown.mapper.ArticleMapper;
import org.crown.model.entity.Article;
import org.crown.service.IArticleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 文章表 服务实现类
 * </p>
 **/
@Service
public class ArticleServiceImpl extends BaseServiceImpl<ArticleMapper, Article> implements IArticleService {

    @Override
    public IPage<Article> pageArticle(Page<Article> page, String articleName) {
        IPage<Article> articlePage = query().like(StringUtils.isNotEmpty(articleName), Article::getArticleName, articleName)
                .page(page);
        return articlePage;
    }

    @Override
    @Transactional
    public void updateStatus(Integer id, StatusEnum status) {
        Article article = getById(id);
        ApiAssert.notNull(ErrorCodeEnum.ENTITY_NOT_FOUND, article);
        article.setStatus(status);
        updateById(article);
    }

}
