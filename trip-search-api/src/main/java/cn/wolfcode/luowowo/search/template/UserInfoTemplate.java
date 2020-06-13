package cn.wolfcode.luowowo.search.template;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;

/**
 * ES 用户  的 domain
 */
@Document(indexName = UserInfoTemplate.INDEX_TYPE_NAME, type = UserInfoTemplate.INDEX_TYPE_NAME)
@Getter
@Setter
public class UserInfoTemplate implements Serializable {
    public static final String INDEX_TYPE_NAME = "luowowo_userinfo";

    @Id
    //@Field 每个文档的字段配置（类型、是否分词、是否存储、分词器 ）
    private Long id;  //用户id同时也是文档id

    @Field(index = true, analyzer = "ik_max_word", store = true, searchAnalyzer = "ik_max_word", type = FieldType.Text)
    private String nickname; //用户名 分词

    @Field(index = true, store = true, type = FieldType.Keyword)
    private String destName;    //目的地名也是城市名

    @Field(index = true, analyzer = "ik_max_word", store = true, searchAnalyzer = "ik_max_word", type = FieldType.Text)
    private String info;    //简介 分词

    private int travelnum;  //游记数量
    private int replynum;   //评论数量
    private int fansnum;    //收藏数量
    private int level;      //等级

    @Field(index = true, store = true, type = FieldType.Keyword)
    private String headUrl; //头像
}
