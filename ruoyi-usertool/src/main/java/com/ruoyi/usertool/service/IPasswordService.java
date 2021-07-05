package com.ruoyi.usertool.service;

import com.ruoyi.usertool.domain.Password;

import java.util.List;

/**
 * 密码Service接口
 *
 * @author ruoyi
 * @date 2021-07-04
 */
public interface IPasswordService
{
    /**
     * 查询密码
     *
     * @param passwordId 密码ID
     * @return 密码
     */
    public Password selectPasswordById(Long passwordId);

    /**
     * 查询密码列表
     *
     * @param password 密码
     * @return 密码集合
     */
    public List<Password> selectPasswordList(Password password);

    /**
     * 新增密码
     *
     * @param password 密码
     * @return 结果
     */
    public int insertPassword(Password password);

    /**
     * 修改密码
     *
     * @param password 密码
     * @return 结果
     */
    public int updatePassword(Password password);

    /**
     * 批量删除密码
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePasswordByIds(String ids);

    /**
     * 删除密码信息
     *
     * @param passwordId 密码ID
     * @return 结果
     */
    public int deletePasswordById(Long passwordId);
}
