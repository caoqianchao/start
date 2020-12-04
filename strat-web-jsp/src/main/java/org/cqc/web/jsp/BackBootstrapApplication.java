package org.cqc.web.jsp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication(scanBasePackages = {"org.cqc.web.jsp"})
public class BackBootstrapApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(BackBootstrapApplication.class, args);
        System.out.println("SPRING BOOT WEB JSP START SUCCESS");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(BackBootstrapApplication.class);
    }
}
