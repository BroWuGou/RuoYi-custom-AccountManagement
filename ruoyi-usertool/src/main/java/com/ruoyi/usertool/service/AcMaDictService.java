package com.ruoyi.usertool.service;

import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.usertool.domain.Password;
import com.ruoyi.usertool.domain.Station;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * RuoYi首创 html调用 thymeleaf 实现字典读取
 *
 * @author ruoyi
 */
@Service("AcMaDict")
public class AcMaDictService {
    @Autowired
    private IStationService stationService;

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private IPasswordService passwordService;

    public List<Station> getStationList() {
        return stationService.selectStationList(null);
    }

    public List<SysUser> getUserList() {
        return sysUserService.selectUserList(new SysUser());
    }

    public List<Password> getPasswordList() {
        return passwordService.selectPasswordList(null);
    }

}
