package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.OrderDetail;
import cn.wolfcode.luowowo.article.domain.OrderProduct;
import cn.wolfcode.luowowo.article.domain.OrderUserDetail;
import cn.wolfcode.luowowo.article.domain.ScoreHistory;
import cn.wolfcode.luowowo.article.mapper.OrderDetailMapper;
import cn.wolfcode.luowowo.article.mapper.OrderProductMapper;
import cn.wolfcode.luowowo.article.mapper.OrderUserDetailMapper;
import cn.wolfcode.luowowo.article.mapper.ScoreHistoryMapper;
import cn.wolfcode.luowowo.article.service.IOrderDetailService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.OrderBox;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class OrderDetailServiceImpl implements IOrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Autowired
    private OrderUserDetailMapper orderUserDetailMapper;

    @Autowired
    private OrderProductMapper orderProductMapper;

    @Autowired
    private ScoreHistoryMapper scoreHistoryMapper;

    /**
     * 高级查询 ,订单
     */
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<OrderDetail> list = orderDetailMapper.query(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 某订单
     */
    public OrderDetail get(Long id) {
        return orderDetailMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增或修改 订单
     */
    public AjaxResult saveOrUpdate(OrderDetail orderDetail) {
        return null;
    }

    /**
     * 用户下单
     */
    public AjaxResult createOrder(OrderBox orderBox) {
        AjaxResult result = new AjaxResult();
        try {

            Date date = new Date();
            //封装订单表数据
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setCreateTime(date);
            orderDetail.setLastUpdateTime(date);
            orderDetail.setCreateUserId(orderBox.getOrderCreateUserId());
            orderDetail.setRealPrice(orderBox.getOrderRealPrice());
            orderDetail.setStatus(OrderDetail.STATUS_ORDERED);  //下单的状态
            orderDetail.setTotalPrice(orderBox.getOrderRealPrice());
            orderDetail.setPullPrice(BigDecimal.valueOf(0));
            //订单入库
            orderDetailMapper.insert(orderDetail);

            //封装订单使用者表数据
            OrderUserDetail orderUserDetail = new OrderUserDetail();
            orderUserDetail.setName(orderBox.getOrderUserName());
            orderUserDetail.setOrderId(orderDetail.getId());
            orderUserDetail.setPhone(orderBox.getOrderUserPhone());
            orderUserDetail.setUserCard(orderBox.getOrderUserCardNumber());
            //订单使用者入库
            orderUserDetailMapper.insert(orderUserDetail);

            //封装订单产品表数据
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderId(orderDetail.getId());
            orderProduct.setProductCount(orderBox.getOrderProductCount());
            orderProduct.setProductName(orderBox.getOrderProductName());
            orderProduct.setProductPrice(orderBox.getOrderRealPrice());
            orderProduct.setProductType(orderBox.getOrderProductType());
            orderProduct.setProductId(orderBox.getOrderProductId());
            //订单产品入库
            orderProductMapper.insert(orderProduct);

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 修改订单状态
     */
    public AjaxResult updateStatus(OrderDetail orderDetail) {
        AjaxResult result = new AjaxResult();
        try {
            //如果是改为已支付状态，对应的用户积分要增加
            if (orderDetail.getStatus().equals(OrderDetail.STATUS_PAIDED)) {
                OrderDetail detail = orderDetailMapper.selectByPrimaryKey(orderDetail.getId());

                ScoreHistory scoreHistory = new ScoreHistory();
                scoreHistory.setUserId(detail.getCreateUserId());
                //判断订单产品类型
                OrderProduct product = detail.getProducts().get(0);
                String type = product.getProductType();
                if (type.equals(OrderProduct.PRODTYPE_FIGHT)) {
                    scoreHistory.setType(ScoreHistory.TYPE_FLIGHT_PAID);
                    scoreHistory.setScore(400L);
                } else if (type.equals(OrderProduct.PRODTYPE_TICKET)) {
                    scoreHistory.setType(ScoreHistory.TYPE_TICKET_PAID);
                    scoreHistory.setScore(200L);
                } else if (type.equals(OrderProduct.PRODTYPE_SCORE)) {
                    scoreHistory.setType(ScoreHistory.TYPE_SCORE_PAID);
                    scoreHistory.setScore(100L);
                } else if (type.equals(OrderProduct.PRODTYPE_TOTAL)) {
                    scoreHistory.setType(ScoreHistory.TYPE_HOTEL_PAID);
                    scoreHistory.setScore(300L);
                }
                scoreHistory.setMsg("订单No." + detail.getId() + " 支付成功：" + product.getProductName());
                scoreHistory.setDayTime(new Date());
                scoreHistoryMapper.insert(scoreHistory);
            }
            orderDetail.setLastUpdateTime(new Date());
            orderDetailMapper.updateStatusByOrderId(orderDetail);
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 购买积分商品，状态成功就为已支付
     */
    public AjaxResult buyScoreProduct(OrderBox orderBox) {
        AjaxResult result = new AjaxResult();
        try {
            //判断积分够不够
            Integer totalScore = scoreHistoryMapper.getTotalScoreByUserId(orderBox.getOrderCreateUserId());
            if (totalScore.intValue()-orderBox.getProductScore() < 0) {
                result.mark("亲~你的积分不够哦~~~");
                return result;
            }

            Date date = new Date();
            //封装订单表数据
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setCreateTime(date);
            orderDetail.setLastUpdateTime(date);
            orderDetail.setCreateUserId(orderBox.getOrderCreateUserId());
            orderDetail.setRealPrice(orderBox.getOrderRealPrice());
            orderDetail.setStatus(OrderDetail.STATUS_PAIDED);  //下单的状态 支付！
            orderDetail.setTotalPrice(orderBox.getOrderRealPrice());
            orderDetail.setPullPrice(BigDecimal.valueOf(0));
            //订单入库
            orderDetailMapper.insert(orderDetail);

            //封装订单使用者表数据
            OrderUserDetail orderUserDetail = new OrderUserDetail();
            orderUserDetail.setName(orderBox.getOrderUserName());
            orderUserDetail.setOrderId(orderDetail.getId());
            orderUserDetail.setPhone(orderBox.getOrderUserPhone());
            orderUserDetail.setUserCard(orderBox.getOrderUserCardNumber());
            //订单使用者入库
            orderUserDetailMapper.insert(orderUserDetail);

            //封装订单产品表数据
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderId(orderDetail.getId());
            orderProduct.setProductCount(orderBox.getOrderProductCount());
            orderProduct.setProductName(orderBox.getOrderProductName());
            orderProduct.setProductPrice(orderBox.getOrderRealPrice());
            orderProduct.setProductType(orderBox.getOrderProductType());
            orderProduct.setProductId(orderBox.getOrderProductId());
            //订单产品入库
            orderProductMapper.insert(orderProduct);

            //用户的积分数减去
            ScoreHistory scoreHistory = new ScoreHistory();
            scoreHistory.setDayTime(date);
            scoreHistory.setScore(Long.valueOf(-orderBox.getProductScore()));
            scoreHistory.setMsg("使用积分购买积分商品: "+ orderBox.getOrderProductName());
            scoreHistory.setType(ScoreHistory.TYPE_SCORE_PAID);
            scoreHistory.setUserId(orderBox.getOrderCreateUserId());
            scoreHistoryMapper.insert(scoreHistory);

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 查询 某用户的所有订单
     */
    public List<OrderDetail> listByUserId(Long userId) {
        return orderDetailMapper.listByUserId(userId);
    }

}
