package com.ruoyi.usertool.service.impl;

import java.text.SimpleDateFormat;
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
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        QueryWrapper<Account> wrapper = new QueryWrapper<>();
        if (account.getAccountId() != null && !account.getAccountId().equals(""))
            wrapper.like("account_id", account.getAccountId());
        if (account.getNickName() != null && !account.getNickName().equals(""))
            wrapper.like("nick_name", account.getNickName());
        if (account.getStatus() != null && !account.getStatus().equals(""))
            wrapper.eq("status", account.getStatus());
        if (account.getUserId() != null)        wrapper.eq("user_id",           account.getUserId());
        if (account.getStationId() != null)     wrapper.eq("station_id",        account.getStationId());
        if (account.getGmtCreate()   != null)   wrapper.like("gmt_create",      simpleDateFormat.format(account.getGmtCreate()));
        if (account.getGmtModified() != null)   wrapper.like("gmt_modified",    simpleDateFormat.format(account.getGmtModified()));

        List<Account> accountList = accountMapper.selectList(wrapper);
        for (Account accountE : accountList) {
            Station station = stationMapper.selectById(accountE.getStationId());
            accountE.setStation(station);
            accountE.setPasswordCnt(getPasswordCntByAccountId(accountE.getId()));
            // TODO: 获取第三方账号绑定数 relevanceCnt
            accountE.setRelevanceCnt(0);
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
        boolean ret = insertPasswords(account);
        if (!ret)
            rows = -1;
        return rows;
    }

    /**
     * 修改账密簿
     * 
     * @param account 账密簿
     * @return 结果
     */
    @Override
    public int updateAccount(Account account)
    {
        return accountMapper.updateById(account);
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
        String[] idsStr = Convert.toStrArray(ids);
        List<String> idsList = Arrays.asList(idsStr);
        int deleteCnt = idsList.size();

        int passwordCnt = getPasswordCntByAccountIds(idsList);
        if (0 != passwordCnt)
            return -1;

        int cnt = accountMapper.deleteBatchIds(idsList);
        int ret = -1;
        if (deleteCnt == cnt)
            ret = cnt;
        return ret;
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
        //暂时不调用
//        accountMapper.deletePasswordsByAccountId(id);
        return -1;
//        return accountMapper.deleteById(id);
    }

    /**
     * 新增password
     * 
     * @param account 账密簿对象
     */
    public boolean insertPasswords(Account account)
    {
        boolean ret = true;
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
                ret = passwordService.saveBatch(list);
//                accountMapper.batchPasswords(list);
            }
        }
        return ret;
    }

    private int getPasswordCntByAccountIds(List<String> idsList) {
        if (idsList.size() == 0)
            return 0;
        QueryWrapper<Password> wrapper = new QueryWrapper<Password>();
        wrapper.in("account_id", idsList);
        int cnt = passwordMapper.selectCount(wrapper);
        return cnt;
    }

    private Integer getPasswordCntByAccountId(Long id) {
        QueryWrapper<Password> wrapper = new QueryWrapper<Password>();
        wrapper.eq("account_id", id);
        return passwordMapper.selectCount(wrapper);
    }



}
