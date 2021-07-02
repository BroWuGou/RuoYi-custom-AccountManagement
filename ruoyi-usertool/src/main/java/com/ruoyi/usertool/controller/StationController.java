package com.ruoyi.usertool.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.usertool.domain.Station;
import com.ruoyi.usertool.service.IStationService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 站点Controller
 * 
 * @author ruoyi
 * @date 2021-07-02
 */
@Controller
@RequestMapping("/usertool/station")
public class StationController extends BaseController
{
    private String prefix = "usertool/station";

    @Autowired
    private IStationService stationService;

    @RequiresPermissions("usertool:station:view")
    @GetMapping()
    public String station()
    {
        return prefix + "/station";
    }

    /**
     * 查询站点列表
     */
    @RequiresPermissions("usertool:station:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Station station)
    {
        startPage();
        List<Station> list = stationService.selectStationList(station);
        return getDataTable(list);
    }

    /**
     * 导出站点列表
     */
    @RequiresPermissions("usertool:station:export")
    @Log(title = "站点", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Station station)
    {
        List<Station> list = stationService.selectStationList(station);
        ExcelUtil<Station> util = new ExcelUtil<Station>(Station.class);
        return util.exportExcel(list, "站点数据");
    }

    /**
     * 新增站点
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存站点
     */
    @RequiresPermissions("usertool:station:add")
    @Log(title = "站点", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Station station)
    {
        return toAjax(stationService.insertStation(station));
    }

    /**
     * 修改站点
     */
    @GetMapping("/edit/{stationId}")
    public String edit(@PathVariable("stationId") Long stationId, ModelMap mmap)
    {
        Station station = stationService.selectStationById(stationId);
        mmap.put("station", station);
        return prefix + "/edit";
    }

    /**
     * 修改保存站点
     */
    @RequiresPermissions("usertool:station:edit")
    @Log(title = "站点", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Station station)
    {
        return toAjax(stationService.updateStation(station));
    }

    /**
     * 删除站点
     */
    @RequiresPermissions("usertool:station:remove")
    @Log(title = "站点", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(stationService.deleteStationByIds(ids));
    }
}
