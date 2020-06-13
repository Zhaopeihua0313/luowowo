package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.OrderUserDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

public interface IOrderUserDetailService {

    /**
     * 高级查询 ,订单使用者信息
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某订单使用者信息
     */
    OrderUserDetail get(Long id);

    /**
     * 新增或修改 订单使用者信息
     */
    AjaxResult saveOrUpdate(OrderUserDetail orderUserDetail);
    
}
