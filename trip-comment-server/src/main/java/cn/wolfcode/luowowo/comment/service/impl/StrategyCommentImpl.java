package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.query.StrategyCommentQueryObject;
import cn.wolfcode.luowowo.comment.repository.StrategyCommentMongoRepository;
import cn.wolfcode.luowowo.comment.service.IStrategyCommentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class StrategyCommentImpl implements IStrategyCommentService {

    //相当于 mysql 的 mapper
    @Autowired
    private StrategyCommentMongoRepository repository;

    /**
     * 操作 点赞攻略评论
     * @param commentId 评论id
     * @param userId 用户id
     */
    @Override
    public void commentThumbUp(String commentId, Long userId) {

        //根据id查找评论
        Optional<StrategyComment> strategyComment = repository.findById(commentId);

        //判断用户是否点赞过
        strategyComment.ifPresent(comment -> {
            List<Long> useList = comment.getThumbuplist();
            if (useList.contains(userId)) {//有,则取消点赞,点赞数减1
                useList.remove(userId);
                comment.setThumbupnum(comment.getThumbupnum()-1);
            }else {//没有,则点赞,数量添加
                useList.add(userId);
                comment.setThumbupnum(comment.getThumbupnum()+1);
            }
            //修改数据库中对应的评论，同步点赞数
            repository.save(comment);
        });
    }

    /**
     * 分页查询 攻略评论
     */
    @Override
    public Page<StrategyComment> query(StrategyCommentQueryObject qo) {

       return repository.findByDetailId(qo.getDetailId(),PageRequest.of(qo.getCurrentPage()-1,qo.getPageSize()));

    }

    /**
     * 保存 攻略评论
     */
    @Override
    public void save(StrategyComment strategyComment) {
        //设置评论时间
        Date date = new Date();
        strategyComment.setCreateTime(date);
        //保存
        repository.save(strategyComment);
    }
}
