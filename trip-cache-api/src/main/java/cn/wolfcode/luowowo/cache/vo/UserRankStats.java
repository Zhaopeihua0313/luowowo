package cn.wolfcode.luowowo.cache.vo;

import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户 统计数据对象 用作存放 redis 中用户的金牌数等统计数据的容器
 */
@Setter
@Getter
@ToString
public class UserRankStats implements Serializable {

    private UserInfo user;//用户

    private Integer goldenNum = 0;//金牌数

    private Integer answersNum = 0;//回答数

    private Integer thumbsupnum = 0;//点赞数

    private List<String> answers = new ArrayList<>();//该用户的回答集合

}
