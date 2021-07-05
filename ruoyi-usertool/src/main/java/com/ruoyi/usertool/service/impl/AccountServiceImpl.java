package com.ruoyi.usertool.service.impl;

import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.usertool.domain.Station;
import com.ruoyi.usertool.mapper.PasswordMapper;
import com.ruoyi.usertool.mapper.StationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.usertool.domain.Password;
import com.ruoyi.usertool.mapper.AccountMapper;
import com.ruoyi.usertool.domain.Account;
import com.ruoyi.usertool.service.IAccountService;
import com.ruoyi.common.core.text.Convert;

/**
 * 账密簿Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-07-03
 */
@Service
public class AccountServiceImpl implements IAccountService 
{
    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private StationMapper stationMapper;

    @Autowired
    private PasswordMapper passwordMapper;

    @Autowired
    private IService<Password> passwordService;

    /**
     * 查询账密簿
     * 
     * @param id 账密簿ID
     * @return 账密簿
     */
    @Override
    public Account selectAccountById(Long id)
    {
        Account account = accountMapper.selectById(id);
        QueryWrapper<Password> wrapper = new QueryWrapper<Password>();
        wrapper.eq("account_id", account.getId());
        account.setPasswordList(passwordService.list(wrapper));

        return account;
    }

    /**
     * 查询账密簿列表
     * 
     * @param account 账密簿
     * @return 账密簿
     */
    @Override
    public List<Account> selectAccountList(Account account)
    {
        QueryWrapper<Account> wrapper = new QueryWrapper<>();
        if (account.getAccountId() != null && !account.getAccountId().equals(""))
            wrapper.like("account_id", account.getAccountId());
        if (account.getNickName() != null && !account.getNickName().equals(""))
            wrapper.like("nick_name", account.getNickName());

        if (account.getStatus() != null && !account.getStatus().equals(""))
            wrapper.eq("status", account.getStatus());

        if (account.getUserId() != null)        wrapper.eq("user_id",         account.getUserId());
        if (account.getStationId() != null)     wrapper.eq("station_id",      account.getStationId());
        if (account.getGmtCreate()   != null)   wrapper.eq("gmt_create",      account.getGmtCreate());
        if (account.getGmtModified() != null)   wrapper.eq("gmt_modified",    account.getGmtModified());

        List<Account> accountList = accountMapper.selectList(wrapper);
        for (Account accountE : accountList) {
            Station station = stationMapper.selectById(accountE.getStationId());
            accountE.setStation(station);
        }

        return accountList;
    }

    /**
     * 新增账密簿
     * 
     * @param account 账密簿
     * @return 结果
     */
    @Transactional
    @Override
    public int insertAccount(Account account)
    {
        int rows = accountMapper.insert(account);
        insertPasswords(account);
        return rows;
    }

    /**
     * 修改账密簿
     * 
     * @param account 账密簿
     * @return 结果
     */
    @Transactional
    @Override
    public int updateAccount(Account account)
    {
        int ret = accountMapper.updateById(account);
//        accountMapper.deletePasswordsByAccountId(account.getId());
//        insertPasswords(account);
        return ret;
    }

    /**
     * 删除账密簿对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteAccountByIds(String ids)
    {
//        accountMapper.deletePasswordsByAccountIds(Convert.toStrArray(ids));
        String[] idsStr = Convert.toStrArray(ids);
        List<String> idsList = Arrays.asList(idsStr);
        return accountMapper.deleteBatchIds(idsList);
    }

    /**
     * 删除账密簿信息
     * 
     * @param id 账密簿ID
     * @return 结果
     */
    @Override
    public int deleteAccountById(Long id)
    {
//        accountMapper.deletePasswordsByAccountId(id);
        return accountMapper.deleteById(id);
    }

    /**
     * 新增password
     * 
     * @param account 账密簿对象
     */
    public void insertPasswords(Account account)
    {
        List<Password> passwordList = account.getPasswordList();
        Long id = account.getId();
        if (StringUtils.isNotNull(passwordList))
        {
            List<Password> list = new ArrayList<Password>();
            for (Password passwords : passwordList)
            {
                passwords.setAccountId(id);
                list.add(passwords);
            }
            if (list.size() > 0)
            {
                passwordService.saveBatch(list);
//                accountMapper.batchPasswords(list);
            }
        }
    }



}
