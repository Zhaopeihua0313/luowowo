package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.service.ISearchService;
import com.alibaba.fastjson.JSON;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.dubbo.config.annotation.Service;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.SearchResultMapper;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.data.elasticsearch.core.aggregation.impl.AggregatedPageImpl;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;

import java.util.ArrayList;
import java.util.List;

@Service
public class SearchServiceImpl implements ISearchService {
    @Autowired
    private ElasticsearchTemplate elasticsearchTemplate;

    /**
     * 获取 模糊查询并且高亮显示
     * @param indexAndType 查询哪个索引和类型
     * @param clz 封装返回的类型字节码
     * @param qo 关键字
     * @param fields 查询哪些字段
     * @param <T> 封装返回的数据类型
     */
    public <T> Page<T> hightLightSearch(String indexAndType, Class<T> clz, SearchQueryObject qo, String... fields) {
        String preTag = "<span style='color:red;font-weight:bold;'>";
        String postTag = "</span>";

        //本地查询器
        NativeSearchQueryBuilder builder = new NativeSearchQueryBuilder();
        builder.withIndices(indexAndType).withTypes(indexAndType);

        //把需要高亮显示的字段封装到高亮条件里
        HighlightBuilder.Field[] fs = new HighlightBuilder.Field[fields.length];
        for (int i = 0; i < fields.length; i++) {
            fs[i] = new HighlightBuilder.Field(fields[i])
                    .preTags(preTag).postTags(postTag);
        }
        //告知模糊查询哪些字段
        builder.withQuery(QueryBuilders.multiMatchQuery(qo.getKeyword(), fields));
        //告知高亮字段
        builder.withHighlightFields(fs);
        //不需要排序
        builder.withPageable(qo.getPageableWithouSort());

        //返回结果，里面替换高亮字段
        return elasticsearchTemplate.queryForPage(builder.build(), clz, new SearchResultMapper() {
            public <T> AggregatedPage<T> mapResults(SearchResponse response, Class<T> clazz, Pageable pageable) {
                List<T> content = new ArrayList<>();

                try {
                    for (SearchHit hit : response.getHits().getHits()) {
                        //转化成 JSON 对象
                        T obj = JSON.parseObject(hit.getSourceAsString(), clazz);

                        //替换高亮显示字段
                        for (HighlightField field : hit.getHighlightFields().values()) {
                            String name = field.getName();
                            Text text = field.getFragments()[0];
                            BeanUtils.setProperty(obj, name, text);
                        }

                        content.add(obj);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
                return new AggregatedPageImpl<>(content, pageable, response.getHits().totalHits);
            }
        });
    }
}
