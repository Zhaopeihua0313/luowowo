package cn.wolfcode.luowowo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling           //开启排程
@SpringBootApplication
public class Mgrsite {

    public static void main(String[] args) {
        SpringApplication.run(Mgrsite.class, args);
    }

}
