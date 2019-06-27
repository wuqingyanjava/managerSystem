
package org.crown.model.entity;

import java.time.LocalDateTime;

import org.crown.enums.AuthTypeEnum;
import org.crown.framework.model.convert.Convert;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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
@TableName("sys_resource")
public class Resource extends Convert {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.INPUT)
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
    @Version
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime updateTime;

}
