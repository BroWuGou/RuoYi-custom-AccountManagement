package com.ruoyi.usertool.domain;

import java.util.List;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 账密簿对象 accounts
 * 
 * @author ruoyi
 * @date 2021-07-03
 */
@Data
@TableName("accounts")
public class Account
{
    private static final long serialVersionUID = 1L;

    /** id */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 归属 */
    @Excel(name = "归属")
    private Long userId;

    /** 站点 */
    @Excel(name = "站点")
    private Long stationId;

    /** 账户名 */
    @Excel(name = "账户名")
    private String accountId;

    /** 账户昵称 */
    @Excel(name = "账户昵称")
    private String nickName;

    /** 备注 */
    @Excel(name = "备注")
    private String description;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtCreate;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtModified;

    /** 删除标记 */
    @TableLogic
    private Integer deleted;

    /** $table.subTable.functionName信息 */
    @TableField(exist = false)
    private List<Password> passwordList;

    /** 站点 */
    @TableField(exist = false)
    private Station station;

}
