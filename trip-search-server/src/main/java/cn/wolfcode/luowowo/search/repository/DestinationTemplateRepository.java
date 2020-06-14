package cn.wolfcode.luowowo.search.repository;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;
import javax.print.attribute.standard.Destination;
import java.util.List;

@Repository
public interface DestinationTemplateRepository extends ElasticsearchRepository<DestinationTemplate,Long>{

    DestinationTemplate findByName(String keyword);

    List<Destination> findByTimeId(SearchQueryObject qo);

    Page<DestinationTemplate> findByTimeId(Long typeValue, Pageable pageable);

    Page<DestinationTemplate> findByDestThemeId(Long typeValue, Pageable pageable);

}
