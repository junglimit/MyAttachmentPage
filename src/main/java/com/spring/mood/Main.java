package com.spring.mood;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan(basePackages = "com.spring.mood")
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
        }
    }