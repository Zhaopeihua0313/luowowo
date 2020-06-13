package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.article.mapper.StrategyThemeMapper;
import cn.wolfcode.luowowo.article.service.IStrategyThemeService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class StrategyThemeServiceImpl implements IStrategyThemeService {

    @Autowired
    private StrategyThemeMapper strategyThemeMapper;

    /**
     * 高级查询 攻略主题
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<StrategyDetail> list = strategyThemeMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 查询 所有攻略主题
     */
    public List<StrategyTheme> listAll() {
        return strategyThemeMapper.selectAll();
    }

    /**
     * 编辑或新增 攻略主题
     */
    public AjaxResult updateById(StrategyTheme theme) {
        AjaxResult result = new AjaxResult();
        try {

            if (theme.getId() == null) {
                strategyThemeMapper.insert(theme);
                System.out.println("");
            } else {
                strategyThemeMapper.updateByPrimaryKey(theme);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

}
