package cn.wolfcode.luowowo.cache.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * 景点 统计数据对象 用作存放 redis 中景点统计数据的容器
 */
@Setter@Getter@ToString
public class ScenicStats implements Serializable {
    //景点id
    private Long scenicId;

    private Integer replynum = 0;       //点评数
    private Integer favornum = 0;       //收藏数
    private Integer visitnum = 0;       //去过数
}
