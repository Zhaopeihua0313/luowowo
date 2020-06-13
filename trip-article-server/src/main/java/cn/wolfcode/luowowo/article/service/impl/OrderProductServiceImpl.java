package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.OrderProduct;
import cn.wolfcode.luowowo.article.mapper.OrderProductMapper;
import cn.wolfcode.luowowo.article.service.IOrderProductService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class OrderProductServiceImpl implements IOrderProductService {

    @Autowired
    private OrderProductMapper orderProductMapper;

    /**
     * 高级查询 ,订单产品
     */
    public PageInfo query(QueryObject qo) {
        return null;
    }

    /**
     * 获取 某订单产品
     */
    public OrderProduct get(Long id) {
        return orderProductMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增或修改 订单产品
     */
    public AjaxResult saveOrUpdate(OrderProduct orderProduct) {
        return null;
    }

}
