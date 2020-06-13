package cn.wolfcode.luowowo.article.domain;


import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 积分商品表
 */
@Setter
@Getter
@NoArgsConstructor
public class ScoreProduct extends BaseDomain {

    //private Long id;            //id

    private String name;        //商品名

    private Long score;         //所要消耗的积分

    private String coverUrl;    //商品封面

    private Long totalNum;      //数量


}