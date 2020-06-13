package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.ThemeCatalog;
import cn.wolfcode.luowowo.article.mapper.ThemeCatalogMapper;
import cn.wolfcode.luowowo.article.service.IThemeCatalogService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class ThemeCatalogServiceImpl implements IThemeCatalogService {

    @Autowired
    private ThemeCatalogMapper themeCatalogMapper;

    public List<ThemeCatalog> list() {
        return themeCatalogMapper.selectAll();
    }
}
