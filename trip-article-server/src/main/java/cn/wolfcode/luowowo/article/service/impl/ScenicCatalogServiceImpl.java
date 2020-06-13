package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.ScenicCatalog;
import cn.wolfcode.luowowo.article.mapper.ScenicCatalogMapper;
import cn.wolfcode.luowowo.article.service.IScenicCatalogService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class ScenicCatalogServiceImpl implements IScenicCatalogService {

    @Autowired
    private ScenicCatalogMapper scenicCatalogMapper;

    /**
     * 高级查询
     */
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<ScenicCatalog> list = scenicCatalogMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 获取 某目的地的景点分类
     */
    public List<ScenicCatalog> listByDestId(Long destId) {
        return scenicCatalogMapper.listByDestId(destId);
    }

    /**
     * 操作 新增或编辑景点分类
     */
    public AjaxResult saveOrUpdate(ScenicCatalog catalog) {
        AjaxResult result = new AjaxResult();
        try {

            if (catalog.getId() == null) {
                scenicCatalogMapper.insert(catalog);
            } else {
                scenicCatalogMapper.updateByPrimaryKey(catalog);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 获取 所有景点分类
     */
    public List<ScenicCatalog> listAll() {
        return scenicCatalogMapper.selectAll();
    }

    /**
     * 获取 某景点的所有分类
     */
    public List<ScenicCatalog> listByScenicId(Long scenicId) {
        return scenicCatalogMapper.listByScenicId(scenicId);
    }

}
