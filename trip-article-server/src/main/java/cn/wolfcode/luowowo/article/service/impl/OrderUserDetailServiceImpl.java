package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.OrderUserDetail;
import cn.wolfcode.luowowo.article.mapper.OrderUserDetailMapper;
import cn.wolfcode.luowowo.article.service.IOrderUserDetailService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class OrderUserDetailServiceImpl implements IOrderUserDetailService {

    @Autowired
    private OrderUserDetailMapper orderUserDetailMapper;

    /**
     * 高级查询 ,订单使用者信息
     */
    public PageInfo query(QueryObject qo) {
        return null;
    }

    /**
     * 获取 某订单使用者信息
     */
    public OrderUserDetail get(Long id) {
        return orderUserDetailMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增或修改 订单使用者信息
     */
    public AjaxResult saveOrUpdate(OrderUserDetail orderUserDetail) {
        return null;
    }

}
