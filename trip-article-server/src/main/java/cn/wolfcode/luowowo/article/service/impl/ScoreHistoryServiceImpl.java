package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.ScoreHistory;
import cn.wolfcode.luowowo.article.mapper.ScoreHistoryMapper;
import cn.wolfcode.luowowo.article.service.IScoreHistoryService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.DateUtil;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import java.util.List;

@Service
public class ScoreHistoryServiceImpl implements IScoreHistoryService {

    @Autowired
    private ScoreHistoryMapper scoreHistoryMapper;

    /**
     * 高级查询 ,积分历史信息
     */
    public PageInfo query(QueryObject qo) {
        return null;
    }

    /**
     * 获取 某积分历史信息
     */
    public ScoreHistory get(Long id) {
        return scoreHistoryMapper.selectByPrimaryKey(id);
    }

    /**
     * 新增或修改 积分历史信息
     */
    public AjaxResult saveOrUpdate(ScoreHistory scoreHistory) {
        return null;
    }

    /**
     * 用户 每日打卡签到增加积分
     */
    public AjaxResult dayCheck(UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        try {
            Date date = new Date();
            //判断用户今天有没有打卡了
            Date starDate = DateUtil.getStarDate(date);
            Date endDate = DateUtil.getEndDate(date);
            List<ScoreHistory> userScoreHistory =
                    scoreHistoryMapper.selectBetweenDateByUserIdAndTypeCount(userInfo.getId(), starDate, endDate,
                            ScoreHistory.TYPE_DAY_CHECK, 1L);
            //今日有打卡就返回不给打卡
            if (userScoreHistory.size() > 0) {
                return result.mark("你今日已经打过卡啦，请明天再来(＾Ｕ＾)ノ");
            }
            ScoreHistory history = new ScoreHistory();
            //当前用户信息
            history.setUser(userInfo);
            history.setUserId(userInfo.getId());
            history.setDayTime(date);
            history.setScore(100L);
            history.setType(ScoreHistory.TYPE_DAY_CHECK);
            history.setMsg("每日打卡签到送积分");
            scoreHistoryMapper.insert(history);
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 用户的积分总数
     */
    public Integer getTotalScoreByUserId(Long userId) {
        return scoreHistoryMapper.getTotalScoreByUserId(userId);
    }

}
