package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.OrderUserDetail;

import java.util.List;

public interface OrderUserDetailMapper {

    int deleteByPrimaryKey(Long id);

    int insert(OrderUserDetail record);

    OrderUserDetail selectByPrimaryKey(Long id);

    List<OrderUserDetail> selectAll();

    int updateByPrimaryKey(OrderUserDetail record);

}