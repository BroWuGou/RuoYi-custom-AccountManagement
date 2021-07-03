package com.ruoyi.usertool.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * ${subTable.functionName}对象 passwords
 * 
 * @author ruoyi
 * @date 2021-07-03
 */
@Data
@TableName("passwords")
public class Passwords extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 密码id：在本数据库中的id */
    @TableId(type = IdType.AUTO)
    private Long passwordId;

    /** 账户id:table accounts->id */
    @Excel(name = "账户id:table accounts->id")
    private Long accountId;

    /** 账户密码 */
    @Excel(name = "账户密码")
    private String password;

    /** 是否有效：0无效，1有效 */
    @Excel(name = "是否有效：0无效，1有效")
    private String status;

    /** 逻辑删除 */
//    @Excel(name = "是否被删除：0未删除，1已删除")
    @TableLogic
    private Integer deleted;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtCreate;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gmtModified;
}
