
package org.crown.model.entity;

import org.crown.framework.model.BaseModel;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 系统用户角色关系表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("sys_user_role")
public class UserRole extends BaseModel {

    private static final long serialVersionUID = 1L;

    public UserRole(Integer uid, Integer roleId) {
        this.uid = uid;
        this.roleId = roleId;
    }

    /**
     * 用户ID
     */
    private Integer uid;

    /**
     * 角色ID
     */
    private Integer roleId;

}
