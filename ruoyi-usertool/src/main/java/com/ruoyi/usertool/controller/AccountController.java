package com.ruoyi.usertool.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.ruoyi.common.core.domain.CxSelect;
import com.ruoyi.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.usertool.domain.Account;
import com.ruoyi.usertool.service.IAccountService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 账密簿Controller
 * 
 * @author ruoyi
 * @date 2021-07-03
 */
@Controller
@RequestMapping("/usertool/account")
public class AccountController extends BaseController
{
    private String prefix = "usertool/account";

    @Autowired
    private IAccountService accountService;

    @RequiresPermissions("usertool:account:view")
    @GetMapping()
    public String account()
    {
        return prefix + "/account";
    }

    /**
     * 查询账密簿列表
     */
    @RequiresPermissions("usertool:account:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Account account)
    {
        startPage();
        List<Account> list = accountService.selectAccountList(account);
        return getDataTable(list);
    }

    /**
     * 导出账密簿列表
     */
    @RequiresPermissions("usertool:account:export")
    @Log(title = "账密簿", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Account account)
    {
        List<Account> list = accountService.selectAccountList(account);
        ExcelUtil<Account> util = new ExcelUtil<Account>(Account.class);
        return util.exportExcel(list, "账密簿数据");
    }

    /**
     * 新增账密簿
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存账密簿
     */
    @RequiresPermissions("usertool:account:add")
    @Log(title = "账密簿", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Account account)
    {
        return toAjax(accountService.insertAccount(account));
    }

    /**
     * 修改账密簿
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Account account = accountService.selectAccountById(id);
        mmap.put("account", account);
        return prefix + "/edit";
    }

    /**
     * 修改保存账密簿
     */
    @RequiresPermissions("usertool:account:edit")
    @Log(title = "账密簿", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Account account)
    {
        return toAjax(accountService.updateAccount(account));
    }

    /**
     * 删除账密簿
     */
    @RequiresPermissions("usertool:account:remove")
    @Log(title = "账密簿", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(accountService.deleteAccountByIds(ids));
    }


    /**
     * 管理密码表
     */
    @GetMapping("/editPasswords/{id}")
    public String editPasswords(@PathVariable("id") Long id, ModelMap mmap)
    {
        Account account = accountService.selectAccountById(id);
        mmap.put("account", account);
        return "usertool/password/edit";
    }

}
