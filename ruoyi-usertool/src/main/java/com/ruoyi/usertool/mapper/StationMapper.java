package com.ruoyi.usertool.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.usertool.domain.Station;
import org.springframework.stereotype.Repository;

/**
 * 站点Mapper接口
 * 
 * @author ruoyi
 * @date 2021-07-02
 */
@Repository
public interface StationMapper extends BaseMapper<Station>
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
     * 删除站点
     *
     * @param stationId 站点ID
     * @return 结果
     */
    public int deleteStationById(Long stationId);

    /**
     * 批量删除站点
     *
     * @param stationIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteStationByIds(String[] stationIds);
}
