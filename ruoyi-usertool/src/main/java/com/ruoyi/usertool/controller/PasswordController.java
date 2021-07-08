package com.ruoyi.usertool.controller;

import java.util.List;
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
import com.ruoyi.usertool.domain.Password;
import com.ruoyi.usertool.service.IPasswordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 密码表Controller
 * 
 * @author ruoyi
 * @date 2021-07-05
 */
@Controller
@RequestMapping("/usertool/password")
public class PasswordController extends BaseController
{
    private String prefix = "usertool/password";

    @Autowired
    private IPasswordService passwordService;

    @RequiresPermissions("usertool:password:view")
    @GetMapping()
    public String password()
    {
        return prefix + "/password";
    }

    /**
     * 查询密码表列表
     */
    @RequiresPermissions("usertool:password:list")
    @PostMapping("/list/{id}")
    @ResponseBody
    public TableDataInfo list(@PathVariable("id") Long id, Password password)
    {
        startPage();
        password.setAccountId(id);
        List<Password> list = passwordService.selectPasswordList(password);
        return getDataTable(list);
    }

    /**
     * 导出密码表列表
     */
    @RequiresPermissions("usertool:password:export")
    @Log(title = "密码表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Password password)
    {
        List<Password> list = passwordService.selectPasswordList(password);
        ExcelUtil<Password> util = new ExcelUtil<Password>(Password.class);
        return util.exportExcel(list, "密码表数据");
    }

    /**
     * 新增密码表
     */
    @GetMapping("/add/{accountId}")
    public String add(@PathVariable("accountId") Long accountId, ModelMap mmap)
    {
        mmap.put("accountId", accountId);
        return prefix + "/add";
    }

    /**
     * 新增保存密码表
     */
    @RequiresPermissions("usertool:password:add")
    @Log(title = "密码表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Password password)
    {
        return toAjax(passwordService.insertPassword(password));
    }

    /**
     * 修改密码表
     */
    @GetMapping("/edit/{passwordId}")
    public String edit(@PathVariable("passwordId") Long passwordId, ModelMap mmap)
    {
        Password password = passwordService.selectPasswordById(passwordId);
        mmap.put("password", password);
        return prefix + "/edit";
    }

    /**
     * 修改保存密码表
     */
    @RequiresPermissions("usertool:password:edit")
    @Log(title = "密码表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Password password)
    {
        return toAjax(passwordService.updatePassword(password));
    }

    /**
     * 删除密码表
     */
    @RequiresPermissions("usertool:password:remove")
    @Log(title = "密码表", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(passwordService.deletePasswordByIds(ids));
    }
}
