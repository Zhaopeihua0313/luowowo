package cn.wolfcode.luowowo.website.util;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * 机票的工具类
 */
public class FlightUtil {
    public static String getFlightInfo(String arrive_code, String leave_code, String query_date) {
        String host = "http://airinfo.market.alicloudapi.com";
        String path = "/airInfos";
        String method = "POST";
        String appcode = "f95bcbb86919468eb308df07d83226b4";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        Map<String, String> querys = new HashMap<String, String>();
        Map<String, String> bodys = new HashMap<String, String>();
        bodys.put("arrive_code", arrive_code);
        bodys.put("leave_code", leave_code);
        bodys.put("query_date", query_date);

        String result = null;
        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
            System.out.println(response.toString());
            //获取response的body
            result = EntityUtils.toString(response.getEntity());
            System.out.println(result);

            System.out.println("hahahahh");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
