package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScenicCommentQueryObject extends QueryObject {

    public static final Integer TYPE_ALL = -1; //全部
    public static final Integer TYPE_PIC = 0; //有图
    public static final Integer TYPE_GRADE = 1; //好中差评
    public static final Integer TYPE_KEYWORD = 2; //内容提及
    public static final Integer TYPE_BESTCOMMENT = 3; //金牌点评

    private Long scenicId; //景点id
    private Integer type = ScenicCommentQueryObject.TYPE_ALL; //评论类型, 默认查询全部
    private Integer category; //评论类型细分
    private Long tagid = -1L; // 标签名称

    public String getKeyword(){
        switch (category){
            //标志性建筑
            case 1 : return "标志性建筑";
            //人很多
            case 2 : return "人很多";
            //值得去
            case 3 : return "值得去";
            //恐高
            case 4 : return "恐高";
            //交通方便
            case 5 : return "交通方便";
        }
        return "";
    }

    public int[] getScore(){
        switch (category){
            case 6: return new int[]{4,5}; //好评
            case 7: return new int[]{2,3}; //中评
            case 8: return new int[]{0,1}; //差评
        }
        return new int[]{};
    }

}
