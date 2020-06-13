package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

/**
 * domain 对应门票表
 */
@Getter
@Setter
@NoArgsConstructor
public class Ticket extends BaseDomain {

    public static final Byte CATA_ADULT_TICKET = 1;         //成人票
    public static final Byte CATA_CHILD_TICKET = 2;         //儿童票
    public static final Byte CATA_ELDERLY_TICKET = 3;       //老人票
    public static final Byte CATA_GENERAL_TICKET = 4;       //通用票

    private Long id;    //id

    private String name;    //门票名称

    private Byte catalog;   //分类：如成人票、儿童票、老人票

    private Long scenicId;  //关联景点id
    private Scenic scenic;  //关联的景点

    private TicketContent content; //关联的门票内容

    private Long[] tagIds;  //管理的标签ids
    private List<TicketTag> tagss;

    private Destination dest; //通过关联的景点联系来的目的地

    private String presetTime;  //预售时间等

    private BigDecimal marketPrice = BigDecimal.valueOf(0); //市场价

    private BigDecimal salePrice = BigDecimal.valueOf(0);   //售价

    //catalog翻译
    public String getCatalogName() {
        String name = "通用票";
        if (catalog == CATA_ADULT_TICKET) {
            name = "成人票";
        } else if (catalog == CATA_CHILD_TICKET) {
            name = "儿童票";
        } else if (catalog == CATA_ELDERLY_TICKET) {
            name = "老人票";
        } else if (catalog == CATA_GENERAL_TICKET) {
            name = "通用票";
        }
        return name;
    }

    //tagIds翻译成json的
    public String getTagIds() {
        return JSON.toJSONString(tagIds);
    }


}