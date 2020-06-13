package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Flight;
import java.util.List;

public interface IFlightService {

    List<Flight> list(String orgCity, String dstCity);

}
