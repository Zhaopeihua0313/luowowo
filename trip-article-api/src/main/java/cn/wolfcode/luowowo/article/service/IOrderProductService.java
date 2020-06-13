package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.OrderProduct;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

public interface IOrderProductService {

    /**
     * 高级查询 ,订单产品
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某订单产品
     */
    OrderProduct get(Long id);

    /**
     * 新增或修改 订单产品
     */
    AjaxResult saveOrUpdate(OrderProduct orderProduct);

}
