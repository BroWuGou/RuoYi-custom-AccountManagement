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
 * 站点对象 station
 * 
 * @author ruoyi
 * @date 2021-07-02
 */

@Data
@TableName("stations")
public class Station
{
    private static final long serialVersionUID = 1L;

    /** id */
    @TableId(type = IdType.AUTO)
    private Long stationId;

    /** 站点名称 */
    @Excel(name = "站点名称")
    private String stationName;

    /** 站点网址 */
    @Excel(name = "站点网址")
    private String websiteUrl;

    /** 客户端下载 */
    @Excel(name = "客户端下载")
    private String downloadUrl;

    /** 客户端名 */
    @Excel(name = "客户端名")
    private String appName;

    /** 备注 */
    private String description;

    /** 站点状态 */
    @Excel(name = "站点状态")
    private String status;

    /** 已删除 */
//    @Excel(name = "已删除")
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
