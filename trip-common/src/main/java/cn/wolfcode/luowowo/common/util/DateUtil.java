package cn.wolfcode.luowowo.common.util;

import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类
 */
public abstract class DateUtil {

    /**
     * 返回某时间的一天内最后的时间
     */
    public static Date getEndDate(Date now) {
        if (now == null) {
            return null;
        }
        Calendar c = Calendar.getInstance();
        c.setTime(now);
        c.set(Calendar.HOUR_OF_DAY, 23);
        c.set(Calendar.MINUTE, 59);
        c.set(Calendar.SECOND, 59);
        c.set(Calendar.MILLISECOND, 999);
        return c.getTime();
    }

    /**
     * 返回某时间的一天内最早的时间
     */
    public static Date getStarDate(Date now) {
        if (now == null) {
            return null;
        }
        Calendar c = Calendar.getInstance();
        c.setTime(now);
        c.set(Calendar.HOUR_OF_DAY, 00);
        c.set(Calendar.MINUTE, 00);
        c.set(Calendar.SECOND, 00);
        c.set(Calendar.MILLISECOND, 000);
        return c.getTime();
    }

    /**
     * 获取两个时间之间的毫秒差
     */
    public static long getDateBetween(Date d1, Date d2) {
        return Math.abs(d1.getTime() - d2.getTime());
    }

}
