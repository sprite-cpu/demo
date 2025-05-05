package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    // GET 요청을 처리하는 메서드
    @GetMapping("/test")
    public String testApi() {
        return "Hello, World! This is a test API!";
    }
}
