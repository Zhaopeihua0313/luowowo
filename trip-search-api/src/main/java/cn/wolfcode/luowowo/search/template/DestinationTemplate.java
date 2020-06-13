package cn.wolfcode.luowowo.search.template;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;

/**
 * ES 目的地  的 domain
 */
@Document(indexName = DestinationTemplate.INDEX_TYPE_NAME, type = DestinationTemplate.INDEX_TYPE_NAME)
@Getter
@Setter
public class DestinationTemplate implements Serializable {
    public static final String INDEX_TYPE_NAME = "luowowo_destination";

    @Id
    //@Field 每个文档的字段配置（类型、是否分词、是否存储、分词器 ）
    private Long id;  //目的地的id

    @Field(index = true, store = true, type = FieldType.Keyword)
    private String name;    //目的地名称 分词

    private Long timeId;     // 旅游时间id

    @Field(type = FieldType.Keyword)
    private String timeName;    // 旅游时间

    private Long destThemeId;     // 主题id

    @Field(index = true, store = true,type = FieldType.Keyword)
    private String destTthemeName;    // 主题名称

    @Field(index = true, analyzer = "ik_max_word", store = true, searchAnalyzer = "ik_max_word", type = FieldType.Text)
    private String info;    //目的地介绍 分词

    @Field(index = true, store = true, type = FieldType.Keyword)
    private String coverUrl; //目的地封面图
}