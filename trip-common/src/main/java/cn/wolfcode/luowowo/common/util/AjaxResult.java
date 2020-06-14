package cn.wolfcode.luowowo.common.util;

import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;

/**
 * ajax 返回结果 容器工具类
 */
@Getter
@Setter
public class AjaxResult implements Serializable {

    //没登录 CODE 常量
    public static final int NO_LOGIN_CODE = 102;
    private Integer code;
    private boolean success = true;
    private String msg;
    private Object data;

    public AjaxResult mark(String msg) {
        this.msg = msg;
        success = false;
        return this;
    }

    public AjaxResult addData(Object data) {
        this.data = data;
        return this;
    }

}
