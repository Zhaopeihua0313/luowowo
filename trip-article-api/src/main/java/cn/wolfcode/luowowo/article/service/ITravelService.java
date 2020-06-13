package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelContent;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface ITravelService {

    /**
     * 高级查询 游记
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某游记的内容
     */
    TravelContent getContent(Long id);

    /**
     * 修改 游记的状态
     */
    AjaxResult updateState(Travel travel);

    /**
     * 新增或编辑 游记
     */
    AjaxResult saveOrUpdate(Travel entity);

    /**
     * 获取 某游记
     */
    Travel get(Long id);

    /**
     * 获取 某目的地点击量前3的游记
     */
    List<Travel> listViewnumTop3(Long destId);

    /**
     * 获取 所有游记
     */
    List<Travel> list();

    /**
     * 修改 游记统计数据
     */
    void updateStats(Travel travel);

    /**
     * 根据用户id查询所有游记
     * @param userId
     * @return
     */
    List<Travel> listTravelByUserId(Long userId);

    /**
     * 查询游记总数
     * @param userId
     * @return
     */
    int listTravelTotal(Long userId);

    Travel getStrategyContent(Long travelId);

}
