package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.OrderDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface OrderDetailMapper {

    int deleteByPrimaryKey(Long id);

    int insert(OrderDetail record);

    OrderDetail selectByPrimaryKey(Long id);

    List<OrderDetail> selectAll();

    int updateByPrimaryKey(OrderDetail record);

    /**
     * 高级查询
     */
    List<OrderDetail> query(QueryObject qo);

    /**
     * 修改订单状态
     */
    void updateStatusByOrderId(OrderDetail orderDetail);

    List<OrderDetail> listByUserId(Long userId);

}