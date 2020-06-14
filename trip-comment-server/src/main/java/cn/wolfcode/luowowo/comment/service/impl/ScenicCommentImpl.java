package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.comment.domain.ScenicComment;
import cn.wolfcode.luowowo.comment.repository.ScenicCommentMongoRepository;
import cn.wolfcode.luowowo.comment.service.IScenicCommentService;
import cn.wolfcode.luowowo.comment.vo.SumResult;
import cn.wolfcode.luowowo.common.query.ScenicCommentQueryObject;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ScenicCommentImpl implements IScenicCommentService {

    //相当于 mysql 的 mapper
    @Autowired
    private ScenicCommentMongoRepository repository;

    @Autowired
    private MongoTemplate template;

    /**
     * 操作 点赞评论
     * @param commentId 评论id
     * @param userId 用户id
     */
    @Override
    public void thumbup(String commentId, Long userId) {
        //根据id查找评论
        Optional<ScenicComment> scenicComment = repository.findById(commentId);
        //判断用户是否点赞过
        scenicComment.ifPresent(comment -> {
            List<Long> userList = comment.getThumbuplist();
            //有,则取消点赞,点赞数减1
            if (userList.contains(userId)) {
                userList.remove(userId);
                comment.setThumbupnum(comment.getThumbupnum()-1);
            }else {//没有,则点赞,数量添加
                userList.add(userId);
                comment.setThumbupnum(comment.getThumbupnum()+1);
            }
            //修改数据库中对应的评论，同步点赞数
            repository.save(comment);
        });
    }

    @Override
    public List<ScenicComment> findByUserId(Long userId) {
        return repository.findByUserId(userId);
    }

    /**
     * 处理分页
     * @param pageable
     * @param list
     * @return
     */
    public List solvePage(Pageable pageable, List list){
        int fromIndex = pageable.getPageSize()*pageable.getPageNumber();
        int toIndex = pageable.getPageSize()*(pageable.getPageNumber()+1);
        int totalElements = list.size();
        if(toIndex> totalElements) toIndex = totalElements;
        list = list.subList(fromIndex,toIndex);
        return list;
    }

    /**
     * 分页查询 攻略评论
     */
    @Override
    public Page<ScenicComment> query(ScenicCommentQueryObject qo) {
        Page<ScenicComment> page = null;
        Pageable pageable = PageRequest.of(qo.getCurrentPage() - 1,3, Sort.by(Sort.Direction.DESC,"createTime"));
        //高级查询
        Integer type = qo.getType();
        Long scenicId = qo.getScenicId();
        switch (type) {
            // 有图
            case 0:
                List<ScenicComment> plist = picture(scenicId);
                List resultList = solvePage(pageable, plist);
                page = new PageImpl<>(resultList,pageable, plist.size()); break;
            //好中差评
            case 1:
                int[] score = qo.getScore();
                List<ScenicComment> slist = byScore(score[0], score[1],scenicId);
                List rsList = solvePage(pageable, slist);
                page = new PageImpl<>(rsList,pageable,slist.size()); break;
            //内容提及
            case 2:
                String keyword = qo.getKeyword();
                List<ScenicComment> clist = bykeyword(keyword,scenicId);
                List rcList = solvePage(pageable, clist);
                page = new PageImpl<>(rcList,pageable,clist.size()); break;
            //金牌点评
            case 3:
                List<ScenicComment> tlist = bythumbupnum(scenicId);
                List rtList = solvePage(pageable, tlist);
                page = new PageImpl<>(rtList,pageable,tlist.size()); break;
            default:
                page = repository.findByScenicId(scenicId, pageable);
                break;
        }
        return page;
    }

    /**
     * 返回各个满足各个条件的点评的数量
     * @param scenicId
     * @return
     */
    public SumResult getSumData(Long scenicId) {
        SumResult result = new SumResult();
        long totalElements = repository.findByScenicId(scenicId, null).getTotalElements();
        result.setTotalComment(totalElements);
        result.setPicture(picture(scenicId).size());
        result.setGood(byScore(4,5,scenicId).size());
        result.setNormal(byScore(2,3,scenicId).size());
        result.setBad(byScore(0,1,scenicId).size());
        result.setFeature(bykeyword("标志性建筑",scenicId).size());
        result.setMostPeople(bykeyword("人很多",scenicId).size());
        result.setWorthToGo(bykeyword("值得去",scenicId).size());
        result.setHigh(bykeyword("恐高",scenicId).size());
        result.setGoodTrans(bykeyword("交通方便",scenicId).size());
        result.setThumupReply(bythumbupnum(scenicId).size());
        return result;
    }

    /**
     * 查询有图片的集合
     * @param scenicId
     * @return
     */
    private List<ScenicComment> picture(Long scenicId){
        Query query = new Query();
        query.addCriteria(new Criteria().orOperator(
            Criteria.where("pics").size(1),
            Criteria.where("pics").size(2),
            Criteria.where("pics").size(3)
        ));
        query.addCriteria(Criteria.where("scenicId").is(scenicId));
        List<ScenicComment> list = template.find(query, ScenicComment.class, "scenic_comment");
        return list;
    }

    /**
     * 查询综合分数区间集合
     * @param scenicId
     * @return
     */
    private List<ScenicComment> byScore(int min, int max, Long scenicId) {
        Query query = new Query();
        query.addCriteria(new Criteria().andOperator(
                Criteria.where("overallScore").gte(min),
                Criteria.where("overallScore").lte(max)
        ));
        query.addCriteria(Criteria.where("scenicId").is(scenicId));
        List<ScenicComment> list = template.find(query, ScenicComment.class, "scenic_comment");
        return list;
    }

    /**
     * 查询目标关键字集合
     * @param scenicId
     * @return
     */
    private List<ScenicComment> bykeyword(String keyword, Long scenicId){
        Query query = new Query();
        query.addCriteria(Criteria.where("content").regex(".*"+keyword+".*"));
        query.addCriteria(Criteria.where("scenicId").is(scenicId));
        List<ScenicComment> list = template.find(query, ScenicComment.class, "scenic_comment");
        return list;
    }

    /**
     * 查询点赞数超过50的集合---金牌点评
     * @param scenicId
     * @return
     */
    private List<ScenicComment> bythumbupnum(Long scenicId){
        Query query = new Query();
        query.addCriteria(Criteria.where("thumbupnum").gt(50));
        query.addCriteria(Criteria.where("scenicId").is(scenicId));
        List<ScenicComment> list = template.find(query, ScenicComment.class, "scenic_comment");
        return list;
    }

    /**
     * 保存 攻略评论
     */
    @Override
    public void save(ScenicComment scenicComment) {
        scenicComment.setCreateTime(new Date());
        repository.save(scenicComment);
    }

}
