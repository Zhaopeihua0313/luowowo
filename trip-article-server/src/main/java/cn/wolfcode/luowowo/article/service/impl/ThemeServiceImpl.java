package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Theme;
import cn.wolfcode.luowowo.article.mapper.ThemeMapper;
import cn.wolfcode.luowowo.article.service.IThemeService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class ThemeServiceImpl implements IThemeService {

    @Autowired
    private ThemeMapper themeMapper;

    public List<Theme> listThemeByCatalogId(Long catalogId) {
        return themeMapper.selectByCatalogId(catalogId);
    }

    public AjaxResult saveOrUpdate(Theme theme) {
        AjaxResult result = new AjaxResult();
        try {
            if (theme.getId() == null) {
                themeMapper.insert(theme);
            } else {
                themeMapper.updateByPrimaryKey(theme);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<Theme> list = themeMapper.selectForList(qo);
        return new PageInfo(list);
    }

    public List<Theme> list() {
        return themeMapper.selectAll();
    }
}
