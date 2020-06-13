package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.repository.DestinationTemplateRepository;
import cn.wolfcode.luowowo.search.service.IDestinationSearchService;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import cn.wolfcode.luowowo.search.vo.StatsResult;
import org.apache.dubbo.config.annotation.Service;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.bucket.composite.CompositeAggregation;
import org.elasticsearch.search.aggregations.bucket.composite.CompositeAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.composite.CompositeValuesSourceBuilder;
import org.elasticsearch.search.aggregations.bucket.composite.TermsValuesSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;

import javax.print.attribute.standard.Destination;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class DestinationSearchServiceImpl implements IDestinationSearchService {

    @Autowired
    private DestinationTemplateRepository repository;

    /**
     * 保存
     */
    public void save(DestinationTemplate template) {
        repository.save(template);
    }

    public DestinationTemplate findByName(String keyword) {
        return repository.findByName(keyword);
    }

    /**
     * 查询 根据条件查询返回查询结果
     *
     * @param condition 条件代号：如
     */
    public List<StatsResult> listCondition(int condition) {
        String id = null;       //识别的id，如可目的地id，攻略主题id
        String name = null;     //名称，如可目的地主题，旅游月份
        switch (condition) {
            case SearchQueryObject.CONDITION_TravelTime:
                id = "timeId";
                name = "timeName";
                break;
            case SearchQueryObject.CONDITION_DESTTHEME:
                id = "timeId";
                name = "timeName";
                break;
        }
        return groupCondition(id, name, condition);
    }

    public List<Destination> queryForDests(SearchQueryObject qo) {
        return repository.findByTimeId(qo);
    }

    public Page query(SearchQueryObject qo) {
        Page<DestinationTemplate> page = null;
        switch (qo.getType()) {
            case SearchQueryObject.CONDITION_TravelTime:
                //根据旅游时间查询
                page = repository.findByTimeId(qo.getTypeValue(), qo.getPageable());
                break;
            case SearchQueryObject.CONDITION_DESTTHEME:
                //根据节假日查询
                page = repository.findByDestThemeId(qo.getTypeValue(), qo.getPageable());
                break;
            default:
                page = repository.findAll(qo.getPageable());
        }

        return page;
    }

    /**
     * 多维桶聚合方法
     *
     * @param id        分组依据id，如按 timeId分、themeId分
     * @param name      分组依据name，如 time、themeName
     * @param condition 额外条件：国内的还是国外，用来决定排除中国数据
     */
    private List<StatsResult> groupCondition(String id, String name, int condition) {
        //统计数据别名
        String groupType = "groupType";
        String idField = "id";
        String nameField = "name";

        NativeSearchQueryBuilder builder = new NativeSearchQueryBuilder();
        //忽略主体数据，只拿桶聚合的数据
        builder.withPageable(PageRequest.of(0, 1));

        //根据条件决定桶聚合分组的依据
        switch (condition) {
            case SearchQueryObject.CONDITION_UNABROAD:
                //CONDITION_UNABROAD->排除非中国数据
                builder.withQuery(QueryBuilders.termQuery("countryId", StatsResult.CHINA_ID));
                break;
            case SearchQueryObject.CONDITION_ABROAD:
                //CONDITION_ABROAD->排除中国数据
                builder.withQuery(
                        QueryBuilders.boolQuery()
                                .mustNot(
                                        QueryBuilders.termQuery("countryId", StatsResult.CHINA_ID)
                                )
                );
                break;
        }

        //多维度桶聚合条件
        List<CompositeValuesSourceBuilder<?>> sources = new ArrayList<>();
        sources.add(new TermsValuesSourceBuilder(idField).field(id));
        sources.add(new TermsValuesSourceBuilder(nameField).field(name));
        //多维度桶聚合 aggs
        CompositeAggregationBuilder group = new CompositeAggregationBuilder(groupType, sources);
        //build 获取分组数据
        builder.addAggregation(group);
        AggregatedPage<DestinationTemplate> page = (AggregatedPage<DestinationTemplate>) repository.search(builder.build());

        //通过别名拿到分组结果
        CompositeAggregation aggs = (CompositeAggregation) page.getAggregation(groupType);

        //遍历分组数组封装结果返回
        List<StatsResult> list = new ArrayList<>();
        for (CompositeAggregation.Bucket bucket : aggs.getBuckets()) {
            Map<String, Object> key = bucket.getKey();
            Object idValue = key.get(idField);
            Object nameValue = key.get(nameField);
            long count = bucket.getDocCount();
            list.add(new StatsResult(Long.parseLong(idValue.toString()), nameValue.toString(), count));
        }
        return list;
    }
}
