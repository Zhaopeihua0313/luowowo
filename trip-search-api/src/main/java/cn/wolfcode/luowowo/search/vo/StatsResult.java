package cn.wolfcode.luowowo.search.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

/**
 * ES 查询的 桶聚合 结果的容器
 * 如：
 * 国内攻略: 直辖市(8)浙江(2)广东(3)四川(2)
 * 海外攻略: 美国(1)日本(1)泰国(1)
 * 主题攻略: 户外(2)美食(4)购物(2)自驾(1)必备(1)摄影(1)旅行主义(1)建筑(4)家庭(2)
 */
@Setter@Getter
@NoArgsConstructor
@AllArgsConstructor
public class StatsResult implements Serializable {
    public static final Long CHINA_ID = 1L;

    private Long id;            //识别的id，如可目的地id，攻略主题id
    private String name;        //名称，如可目的地名称，攻略主题名称
    private Long count;         //总数，如某目的地下攻略的总数，某攻略主题下攻略的总数

    //重写 equals 和 hashCode 为了后面的 set集合 去重
    public boolean equals(Object obj) {
        if (!(obj instanceof StatsResult)) {
            return false;
        }

        StatsResult sr = (StatsResult) obj;
        return id.equals(sr.id);
    }
    public int hashCode() {
        return id.hashCode();
    }
}
