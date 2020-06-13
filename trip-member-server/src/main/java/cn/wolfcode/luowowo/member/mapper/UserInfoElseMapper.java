package cn.wolfcode.luowowo.member.mapper;

import cn.wolfcode.luowowo.member.domain.UserInfoElse;
import org.apache.ibatis.annotations.Param;

public interface UserInfoElseMapper {

    void insert(UserInfoElse entity);

    UserInfoElse selectByUID(Long userinfoId);

    UserInfoElse selectByOpenId(@Param("openid") String openid, @Param("type") String type);

}
