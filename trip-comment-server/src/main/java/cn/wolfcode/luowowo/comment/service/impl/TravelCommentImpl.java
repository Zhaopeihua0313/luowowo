package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.repository.TravelCommentMongoRepository;
import cn.wolfcode.luowowo.comment.service.ITravelCommentService;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Service
public class TravelCommentImpl implements ITravelCommentService {

    @Autowired
    private TravelCommentMongoRepository repository;

    @Reference
    private ITravelService travelService;

    /**
     * 通过游记 ID 查询所有评论
     */
    @Override
    public List<TravelComment> findByTravelId(Long travelId) {
        return repository.findByTravelId(travelId);
    }

    @Override
    public int getReplyNumById(Long userId) {
        int num = 0;
        List<TravelComment> travelComments = repository.findAll();
        List<Travel> travels = travelService.listTravelByUserId(userId);
        for (TravelComment travelComment : travelComments) {
            for (Travel travel : travels) {
                if (travel.getId() == travelComment.getTravelId()){
                    if (travelComment.getRefComment().getId() != null){
                        num++;
                    }
                }
            }
        }
        return num;
    }

    @Override
    public List<TravelComment> findByUserId(Long userId) {
        return repository.findByUserId(userId);
    }

    /**
     * 保存游记评论
     */
    @Override
    public TravelComment save(TravelComment travelComment) {
        //设置评论时间
        Date date = new Date();
        travelComment.setCreateTime(date);
        //判断是不是新增评论还是回复评论
        if(travelComment.getType()== TravelComment.TRAVEL_COMMENT_TYPE){
            //如果是回复评论,则把回复的对象放在新增评论中
            String id = travelComment.getRefComment().getId();
            TravelComment refFravelComment = repository.findById(id).get();
            travelComment.setRefComment(refFravelComment);
        }

        //保存
        repository.save(travelComment);

        return travelComment;
    }

}
