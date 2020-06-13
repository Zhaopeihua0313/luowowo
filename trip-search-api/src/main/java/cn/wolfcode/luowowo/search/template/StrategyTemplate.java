package cn.wolfcode.luowowo.search.template;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.util.Date;

/**
 * ES 攻略  的 domain
 */
@Document(indexName = StrategyTemplate.INDEX_TYPE_NAME, type = StrategyTemplate.INDEX_TYPE_NAME)
@Getter
@Setter
public class StrategyTemplate implements Serializable {
    public static final String INDEX_TYPE_NAME = "luowowo_strategy";

    @Id
    private Long id;    //攻略的id也是文档id

    @Field(analyzer = "ik_max_word", searchAnalyzer = "ik_max_word", type = FieldType.Text)
    private String title;   //攻略标题 分词

    @Field(analyzer = "ik_max_word", searchAnalyzer = "ik_max_word", type = FieldType.Text)
    private String subTitle;    //攻略小标题 分词

    private Long destId;

    @Field(type = FieldType.Keyword)
    private String destName;    //目的地名

    private Long countryId;     //国家id

    @Field(type = FieldType.Keyword)
    private String countryName; //国家名

    private Long provinceId;    //省份id

    @Field(type = FieldType.Keyword)
    private String provinceName;    //省份名

    private Long themeId;   //主题id

    @Field(type = FieldType.Keyword)
    private String themeName;     //主题名

    @Field(analyzer = "ik_max_word", searchAnalyzer = "ik_max_word", type = FieldType.Text)
    private String summary; //摘要 分词

    @Field(type = FieldType.Keyword)
    private String coverUrl;    //封面

    @Field(pattern = "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis", type = FieldType.Date, format = DateFormat.custom)
    private Date createTime;    //创建时间

    private int viewnum;    //阅读数

    private int replynum;   //评论数

    private int favornum;   //收藏数

    private int thumbsupnum;    //点赞数

}