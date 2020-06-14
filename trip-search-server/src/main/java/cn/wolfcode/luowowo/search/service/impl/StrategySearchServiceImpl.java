package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.repository.StrategyTemplateRepository;
import cn.wolfcode.luowowo.search.service.IStrategySearchService;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
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
import java.util.*;

@Service
public class StrategySearchServiceImpl implements IStrategySearchService {

    @Autowired
    private StrategyTemplateRepository repository;

    /**
     * 保存
     */
    public void save(StrategyTemplate template) {
        repository.save(template);
    }

    /**
     * 查询 根据条件查询返回查询结果
     *
     * @param condition 条件代号：如国外攻略、国内攻略、主题攻略
     */
    public List<StatsResult> listCondition(int condition) {
        String id = null;       //识别的id，如可目的地id，攻略主题id
        String name = null;     //名称，如可目的地名称，攻略主题名称
        switch (condition) {
            case SearchQueryObject.CONDITION_UNABROAD:
                id = "provinceId";
                name = "provinceName";
                break;
            case SearchQueryObject.CONDITION_ABROAD:
                id = "countryId";
                name = "countryName";
                break;
            case SearchQueryObject.CONDITION_THEME:
                id = "themeId";
                name = "themeName";
                break;
        }
        return groupCondition(id, name, condition);
    }

    /**
     * 多维桶聚合方法
     *
     * @param id        分组依据id，如按 countryId分、themeId分
     * @param name      分组依据name，如 countryName、themeName
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
                builder.withQuery(QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery("countryId", StatsResult.CHINA_ID)));
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
        AggregatedPage<StrategyTemplate> page = (AggregatedPage<StrategyTemplate>) repository.search(builder.build());
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

    /**
     * 高级查询 攻略
     */
    @Override
    public Page query(SearchQueryObject qo) {
        Page<StrategyTemplate> page = null;
        switch (qo.getType()) {
            case SearchQueryObject.CONDITION_UNABROAD:
                //查询国内
                page = repository.findByProvinceId(qo.getTypeValue(), qo.getPageable());
                break;
            case SearchQueryObject.CONDITION_ABROAD:
                //查询国外.
                page = repository.findByCountryId(qo.getTypeValue(), qo.getPageable());
                break;
            case SearchQueryObject.CONDITION_THEME:
                page = repository.findByThemeId(qo.getTypeValue(), qo.getPageable());
                //查询主题
                break;
            default:
                page = repository.findAll(qo.getPageable());
        }
        return page;
    }

    /**
     * 获取 几个 攻略主题推荐
     */
    public List<Map<String, Object>> listThemeCommendTopCount(int count) {
        //list 里 map 两个key ：theme 和 dests
        ArrayList<Map<String, Object>> list = new ArrayList<>();
        //获取按攻略主题分组的桶聚合
        List<StatsResult> themeList = listCondition(SearchQueryObject.CONDITION_THEME);
        //按需求截取数量
        if (themeList.size() > count) {
            themeList.subList(0, count);
        }
        //遍历主题，根据主题 id 去查该主题下的攻略，攻略里有目的地 id 和 name
        for (StatsResult theme : themeList) {
            List<StrategyTemplate> strategies = repository.findByThemeId(theme.getId(), null).getContent();
            //创建 map 装
            Map<String, Object> map = new HashMap<>();
            //攻略主题封装
            map.put("theme", theme);
            //使用 set 存储去重
            Set<StatsResult> set = new HashSet();
            for (StrategyTemplate stragegy : strategies) {
                set.add( new StatsResult(stragegy.getDestId(), stragegy.getDestName(), null) );
                //主题下的目的地封装
                map.put("dests", set);
            }
            list.add(map);
        }
        return list;
    }

    /**
     * 获取 某些目的地的攻略
     */
    public List<StrategyTemplate> findByDestName(String destName) {
        return repository.findByDestName(destName);
    }

}
