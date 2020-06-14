package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.comment.domain.ScenicComment;
import cn.wolfcode.luowowo.comment.domain.ScenicCommentReply;
import cn.wolfcode.luowowo.comment.repository.ScenicCommentMongoRepository;
import cn.wolfcode.luowowo.comment.repository.ScenicCommentReplyMongoRepository;
import cn.wolfcode.luowowo.comment.service.IScenicCommentReplyService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import java.util.List;

@Service
public class ScenicCommentReplyImpl implements IScenicCommentReplyService {

    @Autowired
    private ScenicCommentReplyMongoRepository replyMongoRepository;

    @Autowired
    private ScenicCommentMongoRepository repository;

    /**
     * 保存 攻略评论
     */
    @Override
    public void save(ScenicCommentReply reply) {
        reply.setCreateTime(new Date());
        replyMongoRepository.save(reply);
        ScenicComment comment = repository.findById(reply.getParentId()).get();
        List<ScenicCommentReply> replyList = comment.getRefComment();
        replyList.add(reply);
        comment.setRefComment(replyList);
        repository.save(comment);
    }

}
