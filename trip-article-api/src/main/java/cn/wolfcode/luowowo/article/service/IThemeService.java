package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Theme;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IThemeService {

    List<Theme> listThemeByCatalogId(Long catalogId);

    AjaxResult saveOrUpdate(Theme theme);

    PageInfo query(QueryObject qo);

    List<Theme> list();
}
