package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.article.mapper.DestinationMapper;
import cn.wolfcode.luowowo.article.mapper.RegionMapper;
import cn.wolfcode.luowowo.article.service.IRegionService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class RegionServiceImpl implements IRegionService {

    @Autowired
    private RegionMapper regionMapper;
    @Autowired
    private DestinationMapper destinationMapper;

    /**
     * 高级查询
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<Region> list = regionMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 编辑或者新增 区域
     */
    public AjaxResult saveOrUpdate(Region region) {
        AjaxResult result = new AjaxResult();
        try {
            //维护目的地表中的 region_id，先设置为空，再设置区域 id
            destinationMapper.deleteRegionIdByRegionId(region.getId());
            System.out.println(region.getRef());
            Long[] refIds = region.getRefIds();
            if (refIds != null) {
                for (Long destId : refIds) {
                    destinationMapper.updateRegionIdById(region.getId(), destId);
                }
            }

            if (region.getId() == null) {
                regionMapper.insert(region);
            } else {
                regionMapper.updateByPrimaryKey(region);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 查询 热门的区域
     */
    public List<Region> listHotRegions() {
        return regionMapper.selectListByHot();
    }

    /**
     * 获取某个区域的热门目的地
     */
    public List<Destination> listHotDestByRegionId(Long regionId) {
        return destinationMapper.selectListHotByRegionId(regionId);
    }

    public Region get(long id) {
        return regionMapper.selectByPrimaryKey(id);
    }

    public List<Region> listAll() {
        return regionMapper.selectAll();
    }

}
