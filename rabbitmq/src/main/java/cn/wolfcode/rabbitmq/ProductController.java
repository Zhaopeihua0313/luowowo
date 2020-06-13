package cn.wolfcode.rabbitmq;

import org.springframework.amqp.rabbit.core.RabbitMessagingTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {
    @Autowired
    private RabbitMessagingTemplate template;
    @RequestMapping("bootQueue")
    public String bootQueue(String msg){
        template.convertAndSend("","boot_hello",msg);
        return "发送成功";
    }
}
