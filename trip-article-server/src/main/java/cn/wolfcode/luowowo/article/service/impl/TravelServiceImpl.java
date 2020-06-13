package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.article.domain.TravelContent;
import cn.wolfcode.luowowo.article.mapper.TravelCommendMapper;
import cn.wolfcode.luowowo.article.mapper.TravelContentMapper;
import cn.wolfcode.luowowo.article.mapper.TravelMapper;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import java.util.List;

@Service
public class TravelServiceImpl implements ITravelService {

    @Autowired
    private TravelMapper travelMapper;

    @Autowired
    private TravelContentMapper travelContentMapper;

    @Autowired
    private TravelCommendMapper travelCommendMapper;

    /**
     * 高级查询 游记
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<StrategyDetail> list = travelMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 某游记的内容
     */
    public TravelContent getContent(Long id) {
        return travelContentMapper.selectById(id);
    }

    /**
     * 修改 游记的状态
     */
    public AjaxResult updateState(Travel travel) {
        AjaxResult result = new AjaxResult();
        try {
            travel.setLastUpdateTime(new Date());
            //如果是发布状态，修改发布时间
            if (travel.getState() == Travel.STATE_RELEASE) {
                travel.setReleaseTime(new Date());
                //维护游记推荐表，将该游记的推荐自动修改为启用
                travelCommendMapper.updateStateByTravelId(TravelCommend.STATE_NORMAL, travel.getId());
            } else {
                //维护游记推荐表，将该游记的推荐自动修改为不启用
                travelCommendMapper.updateStateByTravelId(TravelCommend.STATE_DISABLE, travel.getId());
            }
            travelMapper.updateStateById(travel);
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 新增或编辑 游记
     */
    public AjaxResult saveOrUpdate(Travel entity) {
        AjaxResult result = new AjaxResult();
        try {
            TravelContent content = entity.getTravelContent();          //获取游记内容
            entity.setSummary("AI生成摘要中..");                         //AI生成摘要
            Date date = new Date();
            entity.setLastUpdateTime(date);                             //设置最后更新时间
            if (entity.getId() == null) {
                entity.setReleaseTime(date);
                entity.setState(Travel.STATE_RELEASE);                  //状态为待审核状态
                entity.setCreateTime(date);                             //设置创建时间
                //新增游记
                travelMapper.insert(entity);
                content.setId(entity.getId());
                //维护游记内容表
                travelContentMapper.insert(content);
                result.setData(entity);
            } else {
                //修改游记
                travelMapper.updateByPrimaryKey(entity);
                content.setId(entity.getId());
                //维护游记内容表
                travelContentMapper.updateByPrimaryKey(content);
            }
        } catch (Exception e) {
            result.mark("服务器提示：操作失败");
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 某游记
     */
    public Travel get(Long id) {
        return travelMapper.selectByPrimaryKey(id);
    }

    /**
     * 获取 某目的地点击量前3的游记
     */
    public List<Travel> listViewnumTop3(Long destId) {
        return travelMapper.selectViewnumTop3(destId);
    }

    /**
     * 获取 所有游记
     */
    public List<Travel> list() {
        return travelMapper.selectAll();
    }

    /**
     * 修改 游记统计数据
     */
    public void updateStats(Travel travel) {
        travelMapper.updateStats(travel);
    }

    /**
     * 获取用户id 下所有游记
     * @param userId
     * @return
     */
    @Override
    public List<Travel> listTravelByUserId(Long userId) {
        return travelMapper.selectTravelByUserId(userId);
    }

    /**
     * 获取游记总数
     * @param userId
     * @return
     */
    @Override
    public int listTravelTotal(Long userId) {
        return travelMapper.selectTravelTotal(userId);
    }

    @Override
    public Travel getStrategyContent(Long travelId) {
        return travelMapper.getStrategyContent(travelId);
    }

}
