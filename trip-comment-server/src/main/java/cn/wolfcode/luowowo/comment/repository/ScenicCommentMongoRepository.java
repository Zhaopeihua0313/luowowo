package cn.wolfcode.luowowo.comment.repository;

import cn.wolfcode.luowowo.comment.domain.ScenicComment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ScenicCommentMongoRepository extends MongoRepository<ScenicComment, String> {

    Page<ScenicComment> findByScenicId(Long scenicId, Pageable pageable);

    List<ScenicComment> findByUserId(Long userId);

}
