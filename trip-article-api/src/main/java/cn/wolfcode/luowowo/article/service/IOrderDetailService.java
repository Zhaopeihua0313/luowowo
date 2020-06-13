package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.OrderDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.OrderBox;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IOrderDetailService {

    /**
     * 高级查询 ,订单
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某订单
     */
    OrderDetail get(Long id);

    /**
     * 新增或修改 订单
     */
    AjaxResult saveOrUpdate(OrderDetail orderDetail);

    /**
     * 用户下单
     */
    AjaxResult createOrder(OrderBox orderBox);

    /**
     * 修改订单状态
     */
    AjaxResult updateStatus(OrderDetail orderDetail);

    /**
     * 购买积分商品，状态成功就为已支付
     */
    AjaxResult buyScoreProduct(OrderBox orderBox);

    /**
     * 查询 某用户的所有订单
     */
    List<OrderDetail> listByUserId(Long userId);

}
