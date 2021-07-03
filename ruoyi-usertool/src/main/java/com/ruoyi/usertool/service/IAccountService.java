package com.ruoyi.usertool.service;

import java.util.List;
import com.ruoyi.usertool.domain.Account;

/**
 * 账密簿Service接口
 * 
 * @author ruoyi
 * @date 2021-07-03
 */
public interface IAccountService 
{
    /**
     * 查询账密簿
     * 
     * @param id 账密簿ID
     * @return 账密簿
     */
    public Account selectAccountById(Long id);

    /**
     * 查询账密簿列表
     * 
     * @param account 账密簿
     * @return 账密簿集合
     */
    public List<Account> selectAccountList(Account account);

    /**
     * 新增账密簿
     * 
     * @param account 账密簿
     * @return 结果
     */
    public int insertAccount(Account account);

    /**
     * 修改账密簿
     * 
     * @param account 账密簿
     * @return 结果
     */
    public int updateAccount(Account account);

    /**
     * 批量删除账密簿
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteAccountByIds(String ids);

    /**
     * 删除账密簿信息
     * 
     * @param id 账密簿ID
     * @return 结果
     */
    public int deleteAccountById(Long id);
}
