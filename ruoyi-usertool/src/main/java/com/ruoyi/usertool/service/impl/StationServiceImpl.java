package com.ruoyi.usertool.service.impl;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.annotation.Log;
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
public class StationServiceImpl extends ServiceImpl<StationMapper, Station>
        implements IStationService, IService<Station>
{
    @Autowired
    private StationMapper stationMapper;

    @Autowired
//    private StationService stationService;
    IService<Station> stationIService;
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
        QueryWrapper<Station> wrapper = null;
        if (null != station) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            wrapper = new QueryWrapper<>();
            if (station.getStationName() != null && !station.getStationName().equals(""))
                wrapper.like("station_name", station.getStationName());
            if (station.getWebsiteUrl() != null && !station.getWebsiteUrl().equals(""))
                wrapper.like("website_url", station.getWebsiteUrl());
            if (station.getDownloadUrl() != null && !station.getDownloadUrl().equals(""))
                wrapper.like("download_url", station.getDownloadUrl());
            if (station.getAppName() != null && !station.getAppName().equals(""))
                wrapper.like("app_name", station.getAppName());

            if (station.getStatus() != null && !station.getStatus().equals(""))
                wrapper.eq("status", station.getStatus());

            if (station.getGmtCreate() != null) wrapper.like("gmt_create", simpleDateFormat.format(station.getGmtCreate()));
            if (station.getGmtModified() != null) wrapper.like("gmt_modified", simpleDateFormat.format(station.getGmtModified()));
        }
        // TODO: 修复时间查询无法匹配的问题,新增时间段查询
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
    public int insertStation(Station station) {
//        //检查表中是否存在主键一致的数据
//        QueryWrapper<Station> wrapper = new QueryWrapper<>();
//        if (station.getStationName() != null) {
//            wrapper.eq("station_name", station.getStationName());
//        }
//
//        boolean ret = stationService.saveOrUpdate(station, wrapper);
//        // 如果和被标记删除的数据发生主键冲突，则改为修改到原数据上
        // TODO: 逻辑删除的数据的station_name会与新插入数据重名，导致插入失败，目前暂时将表中的unique去掉，需要在在代码层增加unique实现

        return stationMapper.insert(station);
    }

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
        String[] idsStr = Convert.toStrArray(ids);
        List<String> idsList = Arrays.asList(idsStr);
        return stationMapper.deleteBatchIds(idsList);
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
