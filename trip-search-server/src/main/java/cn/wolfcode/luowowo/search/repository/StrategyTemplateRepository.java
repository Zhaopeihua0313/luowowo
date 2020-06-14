package cn.wolfcode.luowowo.search.repository;

import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface StrategyTemplateRepository extends ElasticsearchRepository<StrategyTemplate,Long>{

    Page findByProvinceId(Long provinceId, Pageable pageable);

    Page findByCountryId(Long countryId, Pageable pageable);

    Page findByThemeId(Long themeId, Pageable pageable);

    List<StrategyTemplate> findByDestName(String destName);

}
