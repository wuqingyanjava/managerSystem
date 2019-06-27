
package org.crown.model.parm;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.crown.enums.MenuTypeEnum;
import org.crown.enums.StatusEnum;
import org.crown.framework.model.convert.Convert;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class MenuPARM extends Convert {

    private static final long serialVersionUID = 1L;

    @NotNull(groups = MenuPARM.Create.class, message = "父菜单不能为空")
    @ApiModelProperty(notes = "父菜单ID，一级菜单为0")
    private Integer parentId;

    @NotBlank(groups = MenuPARM.Create.class, message = "菜单名称不能为空")
    @ApiModelProperty(notes = "菜单名称")
    private String menuName;

    @ApiModelProperty(notes = "路径")
    private String path;

    @ApiModelProperty(notes = "路由")
    private String router;

    @NotNull(groups = MenuPARM.Create.class, message = "类型不能为空")
    @ApiModelProperty(notes = "类型:1:目录,2:菜单,3:按钮")
    private MenuTypeEnum menuType;

    @ApiModelProperty(notes = "菜单图标")
    private String icon;

    @ApiModelProperty(notes = "别名")
    private String alias;

    @NotNull(groups = {MenuPARM.Create.class, MenuPARM.Status.class}, message = "状态不能为空")
    @ApiModelProperty(notes = "状态:0：禁用 1：正常")
    private StatusEnum status;

    @ApiModelProperty(notes = "关联资源ID")
    private List<String> resourceIds;

    @NotNull(groups = {MenuPARM.Create.class,MenuPARM.Update.class}, message = "菜单序号不能为空")
    @ApiModelProperty(notes = "菜单序号")
    private Integer snNum;

    public interface Create {

    }

    public interface Update {

    }

    public interface Status {

    }
}
