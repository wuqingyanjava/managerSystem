
package org.crown.model.dto;

import java.time.LocalDateTime;
import java.util.List;

import org.crown.framework.model.BaseModel;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class RoleDTO extends BaseModel {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(notes = "角色名称")
    private String roleName;

    @ApiModelProperty(notes = "备注")
    private String remark;

    @ApiModelProperty(notes = "菜单ID集合")
    private List<Integer> menuIds;

    @ApiModelProperty(notes = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(notes = "修改时间")
    private LocalDateTime updateTime;

}
