package cn.wolfcode.consumer;

import com.rabbitmq.client.Channel;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;

@Component
public class BootTopic01 {
    @RabbitListener(bindings = @QueueBinding(
            value =  @Queue(),
            exchange = @Exchange(name = "boot_topic_log",type = "topic"),
            key = {"log.*", "order.*"}
    ))
    public void handleQueue(String msg, Channel channel, @Header(AmqpHeaders.DELIVERY_TAG) Long deliveryTag) throws Exception{
        System.out.println("BootTopic01:"+msg);
        channel.basicAck(deliveryTag,false);
    }
}
