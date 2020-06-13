package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.StrategyTag;
import cn.wolfcode.luowowo.article.mapper.StrategyTagMapper;
import cn.wolfcode.luowowo.article.service.IStrategyTagService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class StrategyTagServiceImpl implements IStrategyTagService {

    @Autowired
    private StrategyTagMapper strategyTagMapper;

    /**
     * 高级查询 攻略标签
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<StrategyDetail> list = strategyTagMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 某攻略的所有标签，并且以字符串 tag1,tag2,tag3 返回
     */
    public String selectStrByStrategyId(Long id) {
        return strategyTagMapper.selectStrByStrategyId(id);
    }

    /**
     * 新增或编辑 攻略标签
     */
    public AjaxResult updateById(StrategyTag tag) {
        AjaxResult result = new AjaxResult();
        try {

            if (tag.getId() == null) {
                strategyTagMapper.insert(tag);
            } else {
                System.out.println("");
                strategyTagMapper.updateByPrimaryKey(tag);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 某目的地的所有攻略标签
     */
    public List<StrategyTag> listByDestId(Long destId) {
        return strategyTagMapper.selectListByDestId(destId);
    }
}
