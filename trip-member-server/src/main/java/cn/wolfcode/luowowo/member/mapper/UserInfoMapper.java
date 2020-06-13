package cn.wolfcode.luowowo.member.mapper;

import cn.wolfcode.luowowo.member.domain.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfoMapper {

    void insert(UserInfo entity);

    UserInfo selectByPhone(String phone);

    UserInfo selectByInfo(@Param("phone") String phone, @Param("password") String password);

    UserInfo selectById(Long id);

    List<UserInfo> listAll();

    void updateUser(UserInfo user);

    List<UserInfo> selectCareByUserId(Long userId);

    void updateHeadImgUrl(@Param("headImgUrl")String headImgUrl, @Param("userId")Long userId);

    UserInfo selectByUserId(Long userId);

    void updatePassword(UserInfo user);

    void updatePhone(@Param("userId") Long userId, @Param("phone") String phone);

    List<UserInfo> selectAllFriendByUserId(Long userId);
}
