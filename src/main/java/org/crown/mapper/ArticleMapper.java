
package org.crown.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.crown.framework.mapper.BaseMapper;
import org.crown.model.entity.Article;

/**
 * <p>
 * 文章表 Mapper 接口
 * </p>
 *
 * @author Caratacus
 */
@Mapper
public interface ArticleMapper extends BaseMapper<Article> {
}
