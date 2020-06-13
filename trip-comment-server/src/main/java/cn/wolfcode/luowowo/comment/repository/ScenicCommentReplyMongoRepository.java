package cn.wolfcode.luowowo.comment.repository;

import cn.wolfcode.luowowo.comment.domain.ScenicCommentReply;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScenicCommentReplyMongoRepository extends MongoRepository<ScenicCommentReply, String> {

}
