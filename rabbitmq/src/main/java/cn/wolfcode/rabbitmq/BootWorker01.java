package cn.wolfcode.rabbitmq;

import org.springframework.amqp.rabbit.core.RabbitMessagingTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BootWorker01 {
    @Autowired
    private RabbitMessagingTemplate template;
    @RequestMapping("bootWorker")
    public String handleQueue(){
        for(int i = 0; i < 20; i++){
            template.convertAndSend("","boot_worker","hello,"+i);
        }
        return "发送成功";
    }
}