package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.template.UserInfoTemplate;

import java.util.List;

public interface IUserInfoSearchService {

    /**
     * 保存
     */
    void save(UserInfoTemplate template);

    /**
     * 获取 某些城市的用户
     */
    List<UserInfoTemplate> findByDestName(String destName);

}
