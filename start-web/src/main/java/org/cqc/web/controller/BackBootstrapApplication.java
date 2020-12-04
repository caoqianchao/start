package org.cqc.web.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication(scanBasePackages = {"org.cqc.web"})
public class BackBootstrapApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(BackBootstrapApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(BackBootstrapApplication.class);
    }
}
