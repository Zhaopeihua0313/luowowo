package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.mapper.StrategyCatalogMapper;
import cn.wolfcode.luowowo.article.service.IStrategyCatalogService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class StrategyCatalogServiceImpl implements IStrategyCatalogService {

    @Autowired
    private StrategyCatalogMapper strategyCatalogMapper;

    /**
     * 高级查询 攻略分类
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<StrategyDetail> list = strategyCatalogMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 所有攻略分类
     */
    public List<StrategyCatalog> listAll() {
        return strategyCatalogMapper.selectAll();
    }

    /**
     * 新增或编辑 某攻略分类
     */
    public AjaxResult updateById(StrategyCatalog catalog) {
        AjaxResult result = new AjaxResult();
        try {

            if (catalog.getId() == null) {
                strategyCatalogMapper.insert(catalog);
            } else {
                strategyCatalogMapper.updateByPrimaryKey(catalog);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 某目的地的攻略分类
     */
    public List<StrategyCatalog> listByDestId(Long id) {
        return strategyCatalogMapper.selectByDestId(id);
    }

}
