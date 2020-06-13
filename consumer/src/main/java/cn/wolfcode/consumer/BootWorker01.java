package cn.wolfcode.consumer;

import com.rabbitmq.client.Channel;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
public class BootWorker01 {
    @RabbitListener(queuesToDeclare = @Queue(name = "boot_worker"))
    public void handleQueue(String msg, Channel channel, @Header(AmqpHeaders.DELIVERY_TAG) Long deliveryTag) throws Exception{
        System.out.println("客户端收到消息01"+msg);
        channel.basicAck(deliveryTag,false);
        TimeUnit.SECONDS.sleep(1);
    }
}
