package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.mapper.DestinationMapper;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.common.query.DestQueryObject;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.List;

@Service
public class DestinationServiceImpl implements IDestinationService {

    @Autowired
    private DestinationMapper destinationMapper;

    /**
     * 高级查询 连表父目的地、区域
     */
    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<Destination> list = destinationMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    /**
     * 查询 目的地面包屑导航的数据
     */
    public List<Destination> getToasts(Long parentId) {
        List<Destination> list = new ArrayList<>();
        //当前的父目的地
        Destination dest = destinationMapper.selectByPrimaryKey(parentId);
        //判断当前有没有父目的地
        if (dest != null) {
            while (true) {
                //把父目的地塞到 list 中
                list.add(0, dest);

                //如果有父目的地，就替换父目的地替换到当前，如果找到有父目的地，就跳出循环
                if (dest.getParent() != null) {
                    dest = destinationMapper.selectByPrimaryKey(dest.getParent().getId());
                } else {
                    break;
                }
            }
        }
        return list;
    }

    /**
     * 修改 目的地热门状态
     */
    public AjaxResult changeHotState(Long id, Long hot) {
        AjaxResult result = new AjaxResult();
        try {
            //int a = 1/0;
            destinationMapper.updateHotById(id, hot);

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 编辑 目的地简介
     */
    public AjaxResult setInfo(Long id, String info) {
        AjaxResult result = new AjaxResult();
        try {

            //int a = 1/0;
            destinationMapper.updateInfoById(id, info);

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    /**
     * 查询 所有的目的地
     */
    public List<Destination> list() {
        return destinationMapper.selectAll();
    }

    /**
     * 获取 某区域的目的地
     */
    public List listDestByRegionId(Long rid) {
        return destinationMapper.selectListByRegionId(rid);
    }

    /**
     * 查询 某目的地信息
     */
    public Destination selectById(Long id) {
        return destinationMapper.selectById(id);
    }

    /**
     * 查询 目的地面包屑导航的数据，带目的地的子高点击量的目的地
     */
    public List<Destination> getToastsAndChilds(Long id) {
        List<Destination> list = new ArrayList<>();
        //当前的父目的地
        Destination dest = destinationMapper.selectByIdAndChilds(id);
        //判断当前有没有父目的地
        if (dest != null) {
            while (true) {
                //把父目的地塞到 list 中
                if (!dest.getId().equals(id)) {
                    list.add(0, dest);
                }

                //如果有父目的地，就替换父目的地替换到当前，如果找到有父目的地，就跳出循环
                if (dest.getParent() != null) {
                    dest = destinationMapper.selectByIdAndChilds(dest.getParent().getId());
                } else {
                    break;
                }
            }
        }
        return list;
    }

    /**
     * 获取该目的地的国家
     */
    public Destination getCountry(Long destId) {
        List<Destination> toasts = getToasts(destId);
        return toasts.get(0);
    }

    /**
     * 获取该目的地的省份
     */
    public Destination getProvince(Long destId) {
        List<Destination> toasts = getToasts(destId);
        //只有tosats长度大于1时才有下一级的省份
        return toasts.size() > 1 ? toasts.get(1) : null;
    }

    /**
     * 获取 某父目的地下的所有子目的地
     */
    public List<Destination> listDestsByParentId(Long id) {
        return destinationMapper.selectByParentId(id);
    }

    public Destination selectByScenicId(Long scenicId) {
        return destinationMapper.selectByScenicId(scenicId);
    }

    public List<Destination> listByIdIn(String[] ids) {
        return destinationMapper.listByIdIn(ids);
    }

    public List<Destination> listByIdInJiangQi(String[] ids) {
        return destinationMapper.listByIdInJiangQi(ids);
    }

    public List<Destination> listCityInland() {
        List<Destination> list = new ArrayList<>();
        //查询省份
        List<Destination> list1 = listDestsByParentId(1L);
        for (Destination destination : list1) {
            //查询所有城市
            List<Destination> list2 = listDestsByParentId(destination.getId());
            list.addAll(list2);
        }
        return list;
    }


    public List<Destination> listDestByTimeId(Long timeId) {
        return destinationMapper.selectByTimeId(timeId);
    }

    public List<Destination> listDestByRId(Long regionId) {
        return destinationMapper.selectDestByRegionId(regionId);
    }

    public void save(Destination dest) {
        destinationMapper.insert(dest);
    }

    public PageInfo queryForResult(DestQueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<Destination> list = destinationMapper.selectForResult(qo);
        return new PageInfo(list);
    }

    public List<Destination> listBrothers(Long destId) {
        Destination destination = destinationMapper.selectByPrimaryKey(destId);
        Destination father = destinationMapper.selectByPrimaryKey(destination.getParent().getId());
        List<Destination> brothers = destinationMapper.selectByParentId(father.getId());
        for (int i = 0; i < brothers.size(); i++) {
            if (brothers.get(i).getId().equals(destId)) {
                brothers.remove(i);
            }
        }
        return brothers;
    }

}
