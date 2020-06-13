package cn.wolfcode.luowowo.mgrsite.job;

import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.mgrsite.controller.DataController;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 任务
 */
@Component
public class StatsDataPersistenceJob {

    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Autowired
    private DataController dataController;

    /**
     * 统计数据的缓存数据落地，把 redis 持久化到 mysql 中
     */
    //从0秒开始，每1秒执行1次
    @Scheduled(cron = "0/1 * * * * ?") //缓存数据落地 （只要redis无异常，平时可以不开）
    public void persistence(){

        //dataController.strategyStatsDataDown();     //攻略统计数据
        //dataController.travelStatsDataDown();       //游记统计数据
        dataController.questionStatsDataDown();     //问题统计对象
        System.out.println("--数据落地--> 自动 数据落地" + "【" + new Date() + "】");
    }
}
