package cn.wolfcode.rabbitmq;

import org.springframework.amqp.rabbit.core.RabbitMessagingTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BootPublicController {
    @Autowired
    private RabbitMessagingTemplate template;
    @RequestMapping("boot_logs")
    public String handleQueue(){
        for(int i = 0; i < 20; i++){
            template.convertAndSend("boot_logs","","hello,pub"+i);
        }
        return "发送成功";
    }
}
