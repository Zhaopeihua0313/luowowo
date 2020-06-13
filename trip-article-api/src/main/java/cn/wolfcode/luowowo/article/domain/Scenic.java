package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;
import org.springframework.util.StringUtils;
import java.util.*;

@Getter
@Setter
public class Scenic extends BaseDomain{

    //景点名称
    private String name;
    //简介
    private String intro;
    //地址
    private String location;
    //所在城市id
    private Long destId;
    //关联目的地
    private Destination dest;
    //景点概况作者
    private UserInfo author;
    //概况
    private ScenicContent content;
    //概况创建时间
    private Date createTime;
    //父景点
    private Scenic parent;
    //子景点
    private List<Scenic> children = new ArrayList<>();
    //去过人数
    private Integer visitnum;
    //想去人数
    private Integer favornum;
    //点评数
    private Integer replynum;
    //景点分类
    private ScenicCatalog scenicCatalog;
    //景点封面
    private String coverUrl;
    //景点相册---String
    private String photos;
    //景点相册---数组
    private String[] photoArr;

    //复写get方法
    public String[] getPhotoArr(){
        if(StringUtils.hasLength(photos)){
            return photos.split(",");
        }
        return null;
    }

//    //复写get方法
//    public String getPhotos(){
//        if(photoArr!=null){
//            return StringUtils.arrayToDelimitedString(photoArr, ",");
//        }
//        return null;
//    }

    //用于富文本框上传图片的
    private String photosContent;

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        map.put("destId", destId);
        map.put("dest", dest);
        map.put("author", author);
        map.put("parent", parent);
        map.put("visitnum", visitnum);
        map.put("favornum", favornum);
        map.put("replynum", replynum);
        map.put("scenicCatalog", scenicCatalog);
        map.put("photos", photos);
        map.put("intro", intro);
        map.put("location", location);
        map.put("coverUrl", coverUrl);
        map.put("photosContent", photosContent);
        return JSON.toJSONString(map);
    }

}