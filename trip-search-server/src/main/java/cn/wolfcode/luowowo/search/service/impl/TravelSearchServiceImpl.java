package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.repository.TravelTemplateRepository;
import cn.wolfcode.luowowo.search.service.ITravelSearchService;
import cn.wolfcode.luowowo.search.template.TravelTemplate;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class TravelSearchServiceImpl implements ITravelSearchService {

    @Autowired
    private TravelTemplateRepository repository;

    /**
     * 保存
     */
    public void save(TravelTemplate template) {
        repository.save(template);
    }

    /**
     * 获取 某些目的地的游记
     */
    public List<TravelTemplate> findByDestName(String destName) {
        return repository.findByDestName(destName);
    }

}
