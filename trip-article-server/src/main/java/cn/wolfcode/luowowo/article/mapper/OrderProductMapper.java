package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.OrderProduct;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface OrderProductMapper {

    int deleteByPrimaryKey(Long id);

    int insert(OrderProduct record);

    OrderProduct selectByPrimaryKey(Long id);

    List<OrderProduct> selectAll();

    int updateByPrimaryKey(OrderProduct record);

    /**
     * 获取 某订单的所有产品
     */
    List<OrderProduct> listByOrderId(@Param("orderId") Long orderId);

}