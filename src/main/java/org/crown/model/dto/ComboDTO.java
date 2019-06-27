
package org.crown.model.dto;

import org.crown.framework.model.BaseModel;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 下拉框DTO
 * </p>
 *
 * @author Caratacus
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ComboDTO extends BaseModel {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(notes = "名称")
    private String name;

}
