package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Scenic;
import cn.wolfcode.luowowo.article.domain.ScenicContent;
import cn.wolfcode.luowowo.article.mapper.ScenicContentMapper;
import cn.wolfcode.luowowo.article.mapper.ScenicMapper;
import cn.wolfcode.luowowo.article.service.IScenicService;
import cn.wolfcode.luowowo.common.query.ScenicQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Service
public class ScenicServiceImpl implements IScenicService {

    @Autowired
    private ScenicMapper scenicMapper;
    @Autowired
    private ScenicContentMapper scenicContentMapper;

    /**
     * 高级查询 连表父目的地、区域
     */
    @Override
    public PageInfo query(ScenicQueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPageSize());
        List<Scenic> list = scenicMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    public Scenic getByDeatId(Long destId) {
        return scenicMapper.getByDeatId(destId);
    }

    public List<Scenic> listReplyTOP5(Long destId) {
        return scenicMapper.listReplyTOP5(destId);
    }

    public List<Scenic> listFavorTOP10(Long destId) {
        return scenicMapper.listFavorTOP10(destId);
    }

    public List<Scenic> listByParentId(Long scenicId) {
        return scenicMapper.listByParentId(scenicId);
    }

    public List<Scenic> listAll() {
        return scenicMapper.selectAll();
    }

    public AjaxResult saveOrUpdate(Scenic scenic) {
        AjaxResult result = new AjaxResult();
        try {
            //处理相册富文本域上传的多图片，拼接成字符串
            String photos = scenic.getPhotosContent();
            String photosStr = "";
            String[] photosArr = photos.split("src=\"");
            for (int i = 0; i < photosArr.length; i++) {
                if (i > 0) {
                    if (i == photosArr.length -1) {
                        photosStr += photosArr[i].substring(0, photosArr[i].indexOf("\""));
                    } else {
                        photosStr += photosArr[i].substring(0, photosArr[i].indexOf("\"")) + ",";
                    }
                }
            }
            scenic.setPhotoArr(photosStr.split(","));
            scenic.setPhotos(photosStr);

            if (scenic.getId() == null) {
                scenic.setCreateTime(new Date());
                scenicMapper.insert(scenic);
                //景点内容
                ScenicContent content = new ScenicContent();
                content.setId(scenic.getId());
                content.setContent(scenic.getContent().getContent());
                scenicContentMapper.insert(content);
            } else {
                scenicMapper.updateByPrimaryKey(scenic);
                //景点内容
                ScenicContent content = new ScenicContent();
                content.setId(scenic.getId());
                content.setContent(scenic.getContent().getContent());
                scenicContentMapper.updateById(content);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    public Scenic get(Long scenicId) {
        return scenicMapper.selectByPrimaryKey(scenicId);
    }

    public void updateStats(Scenic scenic) {
        scenicMapper.updateStats(scenic);
    }

    @Override
    public Scenic getScenicContent(Long scenicId) {
        return scenicMapper.getScenicContent(scenicId);
    }

    /**
     * 获取 没有父景点的几个景点
     */
    public List<Scenic> listNoParentCount(int count) {
        return scenicMapper.listNoParentCount(count);
    }

    /**
     * 查询 目的地面包屑导航的数据
     */
//    public List<Scenic> getToasts(Long parentId) {
//        List<Scenic> list = new ArrayList<>();
//        //当前的父目的地
//        Scenic dest = scenicMapper.selectByPrimaryKey(parentId);
//        //判断当前有没有父目的地
//        if (dest != null) {
//            while (true) {
//                //把父目的地塞到 list 中
//                list.add(0, dest);
//
//                //如果有父目的地，就替换父目的地替换到当前，如果找到有父目的地，就跳出循环
//                if (dest.getParent() != null) {
//                    dest = scenicMapper.selectByPrimaryKey(dest.getParent().getId());
//                } else {
//                    break;
//                }
//            }
//        }
//        return list;
//    }


}
