package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.article.mapper.TravelCommendMapper;
import cn.wolfcode.luowowo.article.service.ITravelCommendService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class TravelCommendServiceImpl implements ITravelCommendService {

    @Autowired
    private TravelCommendMapper travelCommendMapper;

    /**
     * 高级查询 游记推荐
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<StrategyDetail> list = travelCommendMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 新增或编辑 游记推荐
     */
    public AjaxResult saveOrUpdate(TravelCommend travelCommend) {
        AjaxResult result = new AjaxResult();
        try {
            //没有序号，就找最大的
            if (travelCommend.getSequence() == null) {
                int maxSequence = travelCommendMapper.getMaxSequence();
                travelCommend.setSequence(maxSequence+1);
            }

            if (travelCommend.getId() == null) {
                travelCommendMapper.insert(travelCommend);
            } else {
                travelCommendMapper.updateByPrimaryKey(travelCommend);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 序号降序排序的前几个游记推荐
     */
    public List<TravelCommend> listTopCount(int count) {
        return travelCommendMapper.selectListTopCount(count);
    };

}
