package cn.wolfcode.luowowo.common.domain;

import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;

@Setter
@Getter
public abstract class BaseDomain implements Serializable { //实现序列化接口，为了可以网络传输

    protected Long id;

}
