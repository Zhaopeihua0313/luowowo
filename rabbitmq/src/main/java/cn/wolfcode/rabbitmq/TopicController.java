package cn.wolfcode.rabbitmq;

import org.springframework.amqp.rabbit.core.RabbitMessagingTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TopicController {

        @Autowired
        private RabbitMessagingTemplate template;
        @RequestMapping("boot_topic")
        public String handleQueue(String key){
            for(int i = 0; i < 20; i++){
                template.convertAndSend("boot_topic_log",key,"hello,topic"+i);
            }
            return "发送成功";
        }

}
