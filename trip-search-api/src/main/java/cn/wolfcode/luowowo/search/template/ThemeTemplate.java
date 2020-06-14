package cn.wolfcode.luowowo.search.template;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import java.io.Serializable;

/**
 * ES  主题的 domain
 */
@Document(indexName = ThemeTemplate.INDEX_TYPE_NAME, type = ThemeTemplate.INDEX_TYPE_NAME)
@Getter
@Setter
public class ThemeTemplate implements Serializable {

    public static final String INDEX_TYPE_NAME = "luowowo_theme";

    @Id
    //@Field 每个文档的字段配置（类型、是否分词、是否存储、分词器 ）
    private Long id;  //主题的id

    @Field(index = true, store = true, type = FieldType.Keyword)
    private String name;    //主题名称 分词

    private Long catalogId;     // 主题分类id

    @Field(index = true, store = true, type = FieldType.Keyword)
    private String catalog;    // 主题分类名称

    @Field(index = true, store = true, type = FieldType.Keyword)
    private String coverUrl;    //封面

}