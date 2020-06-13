package cn.wolfcode.luowowo.common.util;

/**
 * 断言工具类
 */
public abstract class Assert {
    public static void hasLength(String info, String msg) {
        if (info == null || info.trim().length() == 0) {
            //throw new LogicException(msg);
            throw new RuntimeException(msg);
        }
    }

    public static void equalsIgnoreCase(String info1, String info2, String msg) {
        if (!info1.equalsIgnoreCase(info2)) {
            //throw new LogicException(msg);
            throw new RuntimeException(msg);
        }
    }

    public static void equals(String info1, String info2, String msg) {
        if (!info1.equals(info2)) {
            //throw new LogicException(msg);
            throw new RuntimeException(msg);
        }
    }
}
