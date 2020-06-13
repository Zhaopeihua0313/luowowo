package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.ScoreHistory;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import com.github.pagehelper.PageInfo;

public interface IScoreHistoryService {

    /**
     * 高级查询 ,积分历史
     */
    public PageInfo query(QueryObject qo);

    /**
     * 获取 某积分历史
     */
    ScoreHistory get(Long id);

    /**
     * 新增或修改 积分历史
     */
    AjaxResult saveOrUpdate(ScoreHistory scoreHistory);


    /**
     * 用户 每日打卡签到增加积分
     */
    AjaxResult dayCheck(UserInfo userInfo);

    /**
     * 获取 用户的积分总数
     */
    Integer getTotalScoreByUserId(Long userId);

}
