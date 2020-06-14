package cn.wolfcode.luowowo.member.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * mysql 里额外用户表，用作第三方登录的
 */
@Setter
@Getter
@ToString
public class UserInfoElse extends BaseDomain {

    public static final String WECHAT_TYPE = "wechat";
    public static final String QQ_TYPE = "qq";

    private Long userinfoId; //用户id
    private String openid; //第三方互联在该网站上的唯一标识符
    private String type; //辨识哪个第三方

}
