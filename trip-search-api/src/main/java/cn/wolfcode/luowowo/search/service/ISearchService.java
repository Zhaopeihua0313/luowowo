package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import org.springframework.data.domain.Page;

public interface ISearchService {

    /**
     * 获取 模糊查询并且高亮显示
     * @param indexAndType 查询哪个索引和类型
     * @param clz 封装返回的类型字节码
     * @param qo 关键字
     * @param fields 查询哪些字段
     * @param <T> 封装返回的数据类型
     */
    <T> Page<T> hightLightSearch(String indexAndType, Class<T> clz, SearchQueryObject qo, String... fields);
}
