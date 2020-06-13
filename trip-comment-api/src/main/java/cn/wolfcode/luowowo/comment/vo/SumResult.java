package cn.wolfcode.luowowo.comment.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter@Setter
@NoArgsConstructor
public class SumResult implements Serializable {

    private Long totalComment; //评论总数

    private Integer picture; //有照片

    private Integer good; //好评

    private Integer normal; //中评

    private Integer bad; //差评

    private Integer feature; //标志性建筑

    private Integer mostPeople; //人很多

    private Integer worthToGo; //值得去

    private Integer high; //恐高

    private Integer goodTrans; //交通方便

    private Integer thumupReply; //金牌点评

}
