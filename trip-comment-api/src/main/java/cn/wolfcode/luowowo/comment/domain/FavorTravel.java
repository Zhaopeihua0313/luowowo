package cn.wolfcode.luowowo.comment.domain;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;

/**
 * Created by Administrator on 2019/11/24.
 */
@Getter
@Setter
public class FavorTravel implements Serializable {

    private Travel travel;
    private TravelComment travelComment;
    private UserInfo user;

}
