package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.*;
import cn.wolfcode.luowowo.article.mapper.*;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Service
public class StrategyDetailServiceImpl implements IStrategyDetailService {

    @Autowired
    private StrategyDetailMapper strategyDetailMapper;
    @Autowired
    private StrategyContentMapper strategyContentMapper;
    @Autowired
    private StrategyTagMapper strategyTagMapper;
    @Autowired
    private StrategyCatalogMapper strategyCatalogMapper;
    @Autowired
    private StrategyCommendMapper strategyCommendMapper;


    /**
     * 高级查询 攻略文章
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<StrategyDetail> list = strategyDetailMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 某攻略文章
     */
    public StrategyDetail get(Long id) {
        return strategyDetailMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增或编辑 攻略文章
     */
    public AjaxResult saveOrUpdate(StrategyDetail strategyDetail, String tags) {
        AjaxResult result = new AjaxResult();
        try {
            strategyDetail.setSummary("AI生成中...");

            //填充 dest 属性，通过攻略分类来获取
            StrategyCatalog catalog = strategyCatalogMapper.selectByPrimaryKey(strategyDetail.getCatalog().getId());
            Destination destination = new Destination();
            destination.setId(catalog.getDestId());
            strategyDetail.setDest(destination);

            if (strategyDetail.getId() == null) {
                //新增攻略文章
                strategyDetail.setCreateTime(new Date());

                strategyDetailMapper.insert(strategyDetail);

                //新增攻略内容
                StrategyContent content = new StrategyContent();
                content.setId(strategyDetail.getId());
                content.setContent(strategyDetail.getStrategyContent().getContent());
                strategyContentMapper.insert(content);

            } else {
                //编辑攻略文章
                strategyDetailMapper.updateByPrimaryKey(strategyDetail);
                //维护攻略内容
                StrategyContent content = new StrategyContent();
                content.setId(strategyDetail.getId());
                content.setContent(strategyDetail.getStrategyContent().getContent());
                strategyContentMapper.updateByPrimaryKey(content);
            }

            //处理标签 秒杀,xx
            if (tags != null) {
                //先删除旧关系,再保存新关系
                strategyDetailMapper.deleteRelation(strategyDetail.getId());

                //对标签字符串进行分割成数组，然后去比对数据库看有没有，没有才新增
                String[] ts = tags.split(",");
                for (String tagName : ts) {
                    StrategyTag tag = strategyTagMapper.selectByName(tagName);
                    if (tag == null) { //该标签在数据库中不存在
                        tag = new StrategyTag();
                        tag.setName(tagName);
                        //保存数据数据
                        strategyTagMapper.insert(tag);
                    }
                    //当前标签和当前文章的关系
                    strategyDetailMapper.insertRelation(strategyDetail.getId(), tag.getId());
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 某攻略文章的内容
     */
    public StrategyContent getContent(Long id) {
        return strategyContentMapper.selectByPrimaryKey(id);
    }

    /**
     * 获取 点击量前三的文章攻略
     */
    public List<StrategyDetail> listViewnumTop3(Long id) {
        return strategyDetailMapper.selectByViewnumTop3AndDestId(id);
    }

    /**
     * 修改 攻略文章状态
     */
    public AjaxResult updateState(Long id, Long state) {
        AjaxResult result = new AjaxResult();
        try {

            strategyDetailMapper.updateStateById(id, state);
            //维护攻略推荐表
            strategyCommendMapper.updateStateByDetailId(id, state);

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 所有的攻略文章
     */
    public List<StrategyDetail> selectAll() {
        return strategyDetailMapper.selectAll();
    }

    /**
     * 修改 攻略的统计数据
     */
    public void updateStats(StrategyDetail detail) {
        strategyDetailMapper.updateStats(detail);
    }

    @Override
    public StrategyDetail selectDetailById(Long id) {
        //文章
        StrategyDetail detail = strategyDetailMapper.selectByPrimaryKey(id);
        //内容
        StrategyContent content = strategyContentMapper.selectByPrimaryKey(id);
        detail.setStrategyContent(content);
        return detail;
    }

    @Override
    public StrategyDetail getStrategyContent(Long strategyId) {
        return strategyDetailMapper.getStrategyContent(strategyId);
    }
}
