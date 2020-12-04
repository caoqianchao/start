package org.cqc.web.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication(scanBasePackages = {"org.cqc.web"})
public class SampleWebFreeMarkerApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        System.out.println("BEGIN");
        SpringApplication.run(SampleWebFreeMarkerApplication.class, args);
        System.out.println("SUCCESS");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SampleWebFreeMarkerApplication.class);
    }


}
