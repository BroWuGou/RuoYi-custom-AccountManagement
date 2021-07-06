package com.ruoyi.usertool.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.usertool.domain.Password;
import com.ruoyi.usertool.mapper.PasswordMapper;
import com.ruoyi.usertool.service.IPasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

/**
 * 密码Service业务层处理
 *
 * @author ruoyi
 * @date 2021-07-04
 */
@Service
public class PasswordServiceImpl extends ServiceImpl<PasswordMapper, Password>
        implements IPasswordService, IService<Password> {

    @Autowired
    private PasswordMapper passwordMapper;

    @Autowired
    private IService<Password> passwordIService;

    /**
     * 查询密码
     *
     * @param passwordId 密码ID
     * @return 密码
     */
    @Override
    public Password selectPasswordById(Long passwordId) { return passwordMapper.selectById(passwordId); }

    /**
     * 查询密码列表
     *
     * @param password 密码
     * @return 密码
     */
    @Override
    public List<Password> selectPasswordList(Password password)
    {
        QueryWrapper<Password> wrapper = null;
        if (null != password) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            wrapper = new QueryWrapper<>();
            if (password.getAccountId() != null)
                wrapper.eq("account_id", password.getAccountId());
            if (password.getStatus() != null && !password.getStatus().equals(""))
                wrapper.eq("status", password.getStatus());
            if (password.getGmtCreate() != null) wrapper.like("gmt_create", simpleDateFormat.format(password.getGmtCreate()));
            if (password.getGmtModified() != null) wrapper.like("gmt_modified", simpleDateFormat.format(password.getGmtModified()));
        }
        return passwordMapper.selectList(wrapper);
    }

    /**
     * 新增密码
     *
     * @param password 密码
     * @return 结果
     */
    @Override
    public int insertPassword(Password password) {
        return passwordMapper.insert(password);
    }

    /**
     * 修改密码
     *
     * @param password 密码
     * @return 结果
     */
    @Override
    public int updatePassword(Password password) { return passwordMapper.updateById(password); }

    /**
     * 删除密码对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePasswordByIds(String ids)
    {
        String[] idsStr = Convert.toStrArray(ids);
        List<String> idsList = Arrays.asList(idsStr);
        return passwordMapper.deleteBatchIds(idsList);
    }

    /**
     * 删除密码信息
     *
     * @param passwordId 密码ID
     * @return 结果
     */
    @Override
    public int deletePasswordById(Long passwordId) { return passwordMapper.deleteById(passwordId); }
}
