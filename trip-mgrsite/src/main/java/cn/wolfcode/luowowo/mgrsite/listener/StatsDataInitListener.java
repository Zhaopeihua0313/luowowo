package cn.wolfcode.luowowo.mgrsite.listener;

import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.mgrsite.controller.DataController;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 自定义监听器
 */
@Component
public class StatsDataInitListener implements ApplicationListener<ContextRefreshedEvent> {

    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;

    @Autowired
    private DataController dataController;

    //是否开启攻略热数据缓存
    @Value("${hotData.useStrategyStatsInit}")
    private boolean useStrategyStatsInit;

    /**
     * 监听启动类启动后，IOC完成时，自动根据攻略文章数据来创建 redis 的数据做缓存
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {

        //根据开关来决定是否开启热数据缓存
        if (useStrategyStatsInit) {

            //查询指定的数据数据，准备给 redis 做缓存
            dataController.strategyStatsToRedis(false);     //攻略缓存
            dataController.travelStatsToRedis(false);       //游记缓存
            dataController.questionStatsToRedis(false);     //社区问题缓存
            dataController.answerStatsToRedis(false);       //社区回答缓存
            dataController.userRankStatsToRedis(false);       //用户统计缓存


            System.out.println("--redis缓存-- 项目启动 攻略和游记等热数据 从mysql生成redis缓存 初始化完毕" + "【" + new Date() + "】");
        }


    }

}
