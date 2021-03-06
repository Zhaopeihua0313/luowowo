package cn.wolfcode.luowowo.cache.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.io.Serializable;

/**
 * 游记 统计数据对象 用作存放 redis 中游记统计数据的容器
 */
@Setter
@Getter
@ToString
public class TravelStats implements Serializable {

    private Long destId;
    private String destName;
    private String title;
    private Long authorId;
    private String authorName;
    private Long travelId;
    private Integer viewnum = 0;        //阅读数，点击数
    private Integer replynum = 0;       //回复数
    private Integer favornum = 0;       //收藏数
    private Integer sharenum = 0;       //分享数
    private Integer thumbsupnum = 0;    //点赞数

}
