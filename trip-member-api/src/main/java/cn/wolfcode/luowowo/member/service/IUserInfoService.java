package cn.wolfcode.luowowo.member.service;

import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import com.alibaba.fastjson.JSONObject;

import java.util.List;

public interface IUserInfoService {

    /**
     * 判断 验证手机是否可用未被注册
     */
    Boolean checkPhone(String phone);

    /**
     * 处理 用户注册
     */
    Object userRegist(String nickname, String phone, String password, String rpassword, String verifyCode);

    /**
     * 处理 普通用户登录
     */
    AjaxResult userLogin(String phone, String password);

    /**
     * 处理 QQ登录
     */
    AjaxResult userLoginByQQ(JSONObject userInfoJson, String openId);

    /**
     * 处理 Wechat登录
     */
    AjaxResult userLoginByWechat(JSONObject userInfoJson, String openId);

    /**
     * 获取 所有用户
     */
    List<UserInfo> list();

    /**
     * 更新 用户信息
     * @param user
     */
    AjaxResult updateUser(UserInfo user);

    List<UserInfo> listCareByUserId(Long userId);

    AjaxResult updateHeadImgUrl(String headImgUrl, Long userId);

    UserInfo getUpload(Long userId);

    /**
     * 更新密码
     * @param user
     * @param password
     * @param rpassword
     * @param smscode
     * @return
     */
    AjaxResult updatePassword(UserInfo user, String password, String rpassword, String smscode);

    /**
     * 查询电话号码
     * @param phone
     * @return
     */
    UserInfo selectByPhone(String phone);

    /**
     * 更新手机号
     * @param
     */
    void updatePhone(Long userId , String phone);

    List<UserInfo> listAllFriend(Long userId);

    UserInfo get(Long id);

}
