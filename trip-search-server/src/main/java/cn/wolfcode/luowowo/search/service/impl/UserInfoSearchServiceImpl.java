package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.repository.UserInfoTemplateRepository;
import cn.wolfcode.luowowo.search.service.IUserInfoSearchService;
import cn.wolfcode.luowowo.search.template.UserInfoTemplate;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class UserInfoSearchServiceImpl implements IUserInfoSearchService {

    @Autowired
    private UserInfoTemplateRepository repository;

    /**
     * 保存
     */
    public void save(UserInfoTemplate template) {
        repository.save(template);
    }

    /**
     * 获取 某些城市的用户
     */
    public List<UserInfoTemplate> findByDestName(String destName) {
        return repository.findByDestName(destName);
    }

}
