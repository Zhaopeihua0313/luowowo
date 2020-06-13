package cn.wolfcode.luowowo.member.service.impl;

import cn.wolfcode.luowowo.cache.service.IUserRankStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IVerifyCodeCacheService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.Assert;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.domain.UserInfoElse;
import cn.wolfcode.luowowo.member.mapper.UserInfoElseMapper;
import cn.wolfcode.luowowo.member.mapper.UserInfoMapper;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import com.alibaba.fastjson.JSONObject;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


@Service
public class UserInfoServiceImpl implements IUserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private UserInfoElseMapper userInfoElseMapper;
    @Reference
    private IVerifyCodeCacheService verifyCodeCacheService;
    @Reference
    private IUserRankStatsCacheService userRankStatsCacheService;

    /**
     * 判断 验证手机是否可用未被注册
     */
    @Override
    public Boolean checkPhone(String phone) {
        return userInfoMapper.selectByPhone(phone) == null;
    }

    /**
     * 处理 用户注册
     */
    @Override
    public AjaxResult userRegist(String nickname, String phone, String password, String rpassword, String verifyCode) {
        AjaxResult ajaxResult = new AjaxResult();
        try {

            //参数非空
            Assert.hasLength(nickname, "昵称不可为空");
            Assert.hasLength(phone, "手机不可为空");
            Assert.hasLength(password, "密码不可为空");
            Assert.hasLength(rpassword, "确认密码不可为空");
            Assert.hasLength(verifyCode, "验证码不可为空");

            //密码确认
            Assert.equals(password, rpassword, "密码和确认密码不一致");

            //判断验证码对错
            String verifyCode1True = verifyCodeCacheService.getVerifyCode(phone);
            Assert.equalsIgnoreCase(verifyCode, verifyCode1True, "验证码不正确");

            //封装对象入库
            UserInfo userInfo = new UserInfo();
            userInfo.setNickname(nickname);
            userInfo.setGender(UserInfo.GENDER_NONE);
            userInfo.setLevel(1);
            userInfo.setPassword(password);
            userInfo.setPhone(phone);
            userInfoMapper.insert(userInfo);

            //用户注册成功后生成一个对应的用户统计对象
            userRankStatsCacheService.creatNewUserStats(userInfo);


        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.mark(e.getMessage());
        }
        return ajaxResult;
    }

    /**
     * 用户登录
     */
    @Override
    public AjaxResult userLogin(String phone, String password) {
        AjaxResult ajaxResult = new AjaxResult();
        try {
            //非空判断
            Assert.hasLength(phone, "手机不可为空");
            Assert.hasLength(password, "密码不可为空");

            //验证账号
            UserInfo userInfo = userInfoMapper.selectByInfo(phone, password);
            if (userInfo == null) {
                throw new RuntimeException("手机号和密码不匹配");
            }

            //登录操作，登录成功，返回给 website
            ajaxResult.setData(userInfo);

        } catch (Exception e) {
            e.printStackTrace();
            ajaxResult.mark(e.getMessage());
        }
        return ajaxResult;
    }

    /**
     * 处理 QQ登录
     */
    public AjaxResult userLoginByQQ(JSONObject userInfoJson, String openId) {
        AjaxResult result = new AjaxResult();
        try {

            //QQ用户信息
            String nickname = userInfoJson.get("nickname").toString();
            String gender = userInfoJson.get("gender_type").toString();
            String city = userInfoJson.get("province").toString() + userInfoJson.get("city").toString();
            String headImgUrl = userInfoJson.get("figureurl_2").toString().replace("\\/", "/");

            //已经登录过的会存放在数据库，这里判断有没有该用户
            UserInfoElse userInfoElse = userInfoElseMapper.selectByOpenId(openId, UserInfoElse.QQ_TYPE);
            if (userInfoElse == null) {

                //没有用户，为其做记录
                //维护用户表
                UserInfo userInfo = new UserInfo();
                userInfo.setNickname(nickname);
                userInfo.setGender(Integer.valueOf(gender));
                userInfo.setCity(city);
                userInfo.setHeadImgUrl(headImgUrl);
                userInfo.setLevel(1);
                //密码先不做考虑
                userInfo.setPassword("qq");
                userInfoMapper.insert(userInfo);

                //维护中间表
                UserInfoElse userInfoElseSQL = new UserInfoElse();
                userInfoElseSQL.setOpenid(openId);
                userInfoElseSQL.setUserinfoId(userInfo.getId());
                userInfoElseSQL.setType(UserInfoElse.QQ_TYPE);
                userInfoElseMapper.insert(userInfoElseSQL);

                result.setData(userInfo);
            } else {
                //用户已经有登录过了，信息会储存在数据库，那就直接去查就行
                Long userinfoId = userInfoElse.getUserinfoId();
                UserInfo userInfo = userInfoMapper.selectById(userinfoId);
                result.setData(userInfo);
            }


        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 处理 Wechat登录
     */
    public AjaxResult userLoginByWechat(JSONObject userInfoJson, String openId) {
        AjaxResult result = new AjaxResult();
        try {

            //QQ用户信息
            String nickname = userInfoJson.get("nickname").toString();
            String gender = userInfoJson.get("sex") != null ? userInfoJson.get("sex").toString() : "";
            String city = userInfoJson.get("province").toString() + userInfoJson.get("city").toString();
            String headImgUrl = userInfoJson.get("headimgurl").toString().replace("\\/", "/");

            //已经登录过的会存放在数据库，这里判断有没有该用户
            UserInfoElse userInfoElse = userInfoElseMapper.selectByOpenId(openId, UserInfoElse.WECHAT_TYPE);
            if (userInfoElse == null) {

                //没有用户，为其做记录
                //维护用户表
                UserInfo userInfo = new UserInfo();
                userInfo.setNickname(nickname);
                userInfo.setGender(Integer.valueOf(gender));
                userInfo.setCity(city);
                userInfo.setHeadImgUrl(headImgUrl);
                userInfo.setLevel(1);
                //密码先不做考虑
                userInfo.setPassword("wx");
                userInfoMapper.insert(userInfo);

                //维护中间表
                UserInfoElse userInfoElseSQL = new UserInfoElse();
                userInfoElseSQL.setOpenid(openId);
                userInfoElseSQL.setUserinfoId(userInfo.getId());
                userInfoElseSQL.setType(UserInfoElse.WECHAT_TYPE);
                userInfoElseMapper.insert(userInfoElseSQL);

                result.setData(userInfo);
            } else {
                //用户已经有登录过了，信息会储存在数据库，那就直接去查就行
                Long userinfoId = userInfoElse.getUserinfoId();
                UserInfo userInfo = userInfoMapper.selectById(userinfoId);
                result.setData(userInfo);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 所有用户
     */
    public List<UserInfo> list() {
        return userInfoMapper.listAll();
    }

    /**
     * 更新用户信息
     */
    @Override
    public AjaxResult updateUser(UserInfo user) {
        AjaxResult result = new AjaxResult();
        try {
            if (user.getId() != null) {
                userInfoMapper.updateUser(user);
            } else {
                userInfoMapper.insert(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;

    }

    @Override
    public List<UserInfo> listCareByUserId(Long userId) {
        return userInfoMapper.selectCareByUserId(userId);
    }

    @Override
    public AjaxResult updateHeadImgUrl(String headImgUrl, Long userId) {
        AjaxResult result = new AjaxResult();
        try {
            userInfoMapper.updateHeadImgUrl(headImgUrl, userId);
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    @Override
    public UserInfo getUpload(Long userId) {
        UserInfo user = userInfoMapper.selectByUserId(userId);
        return user;
    }

    @Override
    public AjaxResult updatePassword(UserInfo user, String password, String rpassword, String smscode) {
        AjaxResult result = new AjaxResult();

        try {
            //参数非空
            Assert.hasLength(smscode, "验证码不可为空");
            Assert.hasLength(password, "密码不可为空");
            Assert.hasLength(rpassword, "确认密码不可为空");

            //验证码校验
            Assert.equalsIgnoreCase(smscode, verifyCodeCacheService.getVerifyCode(user.getPhone()), "验证码错误");
            //密码校验
            Assert.equalsIgnoreCase(password, rpassword, "密码不一致");
            user.setPassword(password);
            //修改用户密码
            userInfoMapper.updatePassword(user);
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
            return result;
        }

    @Override
    public UserInfo selectByPhone(String phone) {
        return userInfoMapper.selectByPhone(phone);
    }

    @Override
    public void updatePhone(Long userId, String phone) {
        userInfoMapper.updatePhone(userId , phone);
    }

    @Override
    public List<UserInfo> listAllFriend(Long userId) {
        return userInfoMapper.selectAllFriendByUserId(userId);
    }

    /**
     * 获取某个用户
     */
    public UserInfo get(Long id) {
        return userInfoMapper.selectById(id);
    }

}












































