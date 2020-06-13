package cn.wolfcode.luowowo.article.query;

import cn.wolfcode.luowowo.common.query.QueryObject;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QuestionQueryObject extends QueryObject {

    private int pageSize = 10;
    private Long qid = -1L;    //问题id

}
