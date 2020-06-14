package cn.wolfcode.luowowo.search.repository;

import cn.wolfcode.luowowo.search.template.ThemeTemplate;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ThemeTemplateRepository extends ElasticsearchRepository<ThemeTemplate,Long>{

}
