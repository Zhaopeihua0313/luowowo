package cn.wolfcode.luowowo.article.box;

import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.io.Serializable;

/**
 * 积分容器 用于控制器接收和传输
 */
@Getter
@Setter
@NoArgsConstructor
public class ScoreBox implements Serializable {

    private UserInfo user;      //用户信息

    private Integer totalScore; //总积分

}
