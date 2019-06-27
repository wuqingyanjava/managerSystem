
package org.crown.model.dto;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.crown.enums.AuthTypeEnum;
import org.crown.framework.model.convert.Convert;

import java.time.LocalDateTime;

/**
 * <p>
 * 资源表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ResourceDTO extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private String id;
    /**
     * 资源名称
     */
    private String resourceName;

    /**
     * 路径映射
     */
    private String mapping;

    /**
     * 请求方式
     */
    private String method;

    /**
     * 权限认证类型
     */
    private AuthTypeEnum authType;
    /**
     * 权限标识
     */
    private String perm;
    /**
     * 修改时间
     */
    private LocalDateTime updateTime;

}
