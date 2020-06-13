package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Getter
@Setter
public class Flight extends BaseDomain {

    private String flightNo;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date tkTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date arTime;
    private String leavePort;
    private String arrivePort;
    private String tkName;
    private String arName;
    private String name;
    private Long cityTkId;
    private Long cityArId;

}