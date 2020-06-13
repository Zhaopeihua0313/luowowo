package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.mapper.StrategyCommendMapper;
import cn.wolfcode.luowowo.article.service.IStrategyCommendService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class StrategyCommendServiceImpl implements IStrategyCommendService {

    @Autowired
    private StrategyCommendMapper strategyCommendMapper;

    /**
     * 高级查询 攻略推荐
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<StrategyDetail> list = strategyCommendMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 排序降序前五的攻略推荐
     */
    public List<StrategyCommend> listTopCount(int count) {
        return strategyCommendMapper.selectListTopCount(count);
    }

    /**
     * 新增或编辑 攻略推荐
     */
    public AjaxResult saveOrUpdate(StrategyCommend strategyCommend) {
        AjaxResult result = new AjaxResult();
        try {
            //没有序号，就找最大的
            if (strategyCommend.getSequence() == null) {
                int maxSequence = strategyCommendMapper.getMaxSequence();
                strategyCommend.setSequence(maxSequence+1);
            }

            if (strategyCommend.getId() == null) {
                strategyCommendMapper.insert(strategyCommend);
            } else {
                strategyCommendMapper.updateByPrimaryKey(strategyCommend);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

}
