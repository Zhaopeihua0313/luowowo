package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.template.TravelTemplate;

import java.util.List;

public interface ITravelSearchService {

    /**
     * 保存
     */
    void save(TravelTemplate template);

    /**
     * 获取 某些目的地的游记
     */
    List<TravelTemplate> findByDestName(String destName);
}
