package cn.wolfcode.luowowo.comment.repository;

import cn.wolfcode.luowowo.comment.domain.TravelComment;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TravelCommentMongoRepository extends MongoRepository<TravelComment, java.lang.String> {    //第一个参数是要操作的集合，第二个参数是集合里的数据类型

    List<TravelComment> findByTravelId(Long travelId);


    List<TravelComment> findByUserId(Long userId);

}
