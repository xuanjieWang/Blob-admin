package com.ruoyi.common.core.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.token.TokenService;

/**
 * 用户信息获取
 */
public class Handler extends BaseController {

    @Autowired
    private TokenService tokenService;

//    protected boolean hasRoleName(String roleName) {
//        SysUser sysUser = currentSysUser();
//        if (sysUser == null) {
//            return false;
//        }
//        return sysUser.getRoles().stream().map(SysRole::getRoleName).anyMatch(roleName::equals);
//    }
//
//    protected boolean hasRoleKey(String roleKey) {
//        SysUser sysUser = currentSysUser();
//        if (sysUser == null) {
//            return false;
//        }
//        return sysUser.getRoles().stream().map(SysRole::getRoleKey).anyMatch(roleNameItem -> roleNameItem.equals(roleKey));
//    }

//    protected SysUser currentSysUser() {
//        SysLoginUser sysLoginUser = tokenService.getLoginUser(ServletUtils.getRequest());
//        if (sysLoginUser != null) {
//            return sysLoginUser.getUser();
//        }
//        return null;
//    }

//    protected AUser currentMiniUser() {
//        MiniLoginUser miniLoginUser = tokenService.getLoginUser(ServletUtils.getRequest());
//        if (miniLoginUser != null) {
//            return miniLoginUser.getUser();
//        }
//        logger.error("获取用户失败!");
//        throw new ServiceException("获取用户失败!", HttpStatus.LOGIN_FAILURE);
//    }

//    protected AQcConfig currentQcConfig(String applyInfo) {
//
//        AQcConfig qcConfig = qcConfigService.getBySubShowAs(applyInfo);
//        if (qcConfig == null) {
//            logger.error("获取证照类型不存在!");
//            throw new ServiceException("获取证照类型不存在!", HttpStatus.NOT_FIND_QC);
//        }
//        return qcConfig;
//    }
}
