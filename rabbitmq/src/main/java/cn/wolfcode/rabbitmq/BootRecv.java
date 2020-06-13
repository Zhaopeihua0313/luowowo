package cn.wolfcode.rabbitmq;

import com.rabbitmq.client.Channel;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;

@Component
public class BootRecv {
    @RabbitListener(queuesToDeclare = @Queue(name = "boot_hello"))
    public void handleQueue(String msg, Channel channel, @Header(AmqpHeaders.DELIVERY_TAG) Long deliveryTag) throws Exception{
        System.out.println("客户端收到消息："+ msg);
    }
}
