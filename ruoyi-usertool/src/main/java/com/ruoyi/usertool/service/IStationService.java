package com.ruoyi.usertool.service;

import java.util.List;
import com.ruoyi.usertool.domain.Station;

/**
 * 站点Service接口
 * 
 * @author ruoyi
 * @date 2021-07-02
 */
public interface IStationService 
{
    /**
     * 查询站点
     * 
     * @param stationId 站点ID
     * @return 站点
     */
    public Station selectStationById(Long stationId);

    /**
     * 查询站点列表
     * 
     * @param station 站点
     * @return 站点集合
     */
    public List<Station> selectStationList(Station station);

    /**
     * 新增站点
     * 
     * @param station 站点
     * @return 结果
     */
    public int insertStation(Station station);

    /**
     * 修改站点
     * 
     * @param station 站点
     * @return 结果
     */
    public int updateStation(Station station);

    /**
     * 批量删除站点
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteStationByIds(String ids);

    /**
     * 删除站点信息
     * 
     * @param stationId 站点ID
     * @return 结果
     */
    public int deleteStationById(Long stationId);
}
