package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import cn.wolfcode.luowowo.search.vo.StatsResult;
import org.springframework.data.domain.Page;
import javax.print.attribute.standard.Destination;
import java.util.List;

public interface IDestinationSearchService {

    /**
     * 保存
     */
    void save(DestinationTemplate template);

    DestinationTemplate findByName(String keyword);

    /**
     * 查询 根据条件查询返回查询结果
     * @param condition 条件代号：如主题，旅游月份
     */
    List<StatsResult> listCondition(int condition);

    /**
     * //根据旅游月份查询目的地
     * @param qo
     * @return
     */
    List<Destination> queryForDests(SearchQueryObject qo);

    Page query(SearchQueryObject qo);

}
