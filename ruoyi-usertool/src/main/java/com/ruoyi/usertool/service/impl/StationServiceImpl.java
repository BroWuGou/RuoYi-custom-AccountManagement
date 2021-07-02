package com.ruoyi.usertool.service.impl;

import java.util.HashMap;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.usertool.mapper.StationMapper;
import com.ruoyi.usertool.domain.Station;
import com.ruoyi.usertool.service.IStationService;
import com.ruoyi.common.core.text.Convert;

/**
 * 站点Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-07-02
 */
@Service
public class StationServiceImpl implements IStationService 
{
    @Autowired
    private StationMapper stationMapper;

    /**
     * 查询站点
     * 
     * @param stationId 站点ID
     * @return 站点
     */
    @Override
    public Station selectStationById(Long stationId) { return stationMapper.selectById(stationId); }

    /**
     * 查询站点列表
     * 
     * @param station 站点
     * @return 站点
     */
    @Override
    public List<Station> selectStationList(Station station)
    {
        QueryWrapper<Station> wrapper = new QueryWrapper<>();
        if (station.getStationName() != null || station.getStationName().equals("")) wrapper.like("station_name", station.getStationName());
        if (station.getWebsiteUrl()  != null || station.getStationName().equals("")) wrapper.like("website_url",  station.getWebsiteUrl());
        if (station.getDownloadUrl() != null || station.getStationName().equals("")) wrapper.like("download_url", station.getDownloadUrl());
        if (station.getAppName()     != null || station.getStationName().equals("")) wrapper.like("app_name",     station.getAppName());
        if (station.getValid()       != null) wrapper.eq("valid",          station.getValid());
        if (station.getDeleted()     != null) wrapper.eq("deleted",        station.getDeleted());
        if (station.getGmtCreate()   != null) wrapper.eq("gmt_create",     station.getGmtCreate());
        if (station.getGmtModified() != null) wrapper.eq("gmt_modified",   station.getGmtModified());

        return stationMapper.selectList(wrapper);
//        return stationMapper.selectStationList(station);
    }

    /**
     * 新增站点
     * 
     * @param station 站点
     * @return 结果
     */
    @Override
    public int insertStation(Station station) { return stationMapper.insert(station); }

    /**
     * 修改站点
     * 
     * @param station 站点
     * @return 结果
     */
    @Override
    public int updateStation(Station station) { return stationMapper.updateById(station); }

    /**
     * 删除站点对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteStationByIds(String ids)
    {
        return 0;
//        return stationMapper.deleteStationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除站点信息
     * 
     * @param stationId 站点ID
     * @return 结果
     */
    @Override
    public int deleteStationById(Long stationId) { return stationMapper.deleteById(stationId); }
}
