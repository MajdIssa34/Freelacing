package com.majd.freelancing;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;
import com.mongodb.client.MongoClients;

@Configuration
public class MongoConfig {

    @Bean
    public MongoTemplate mongoTemplate() {
        return new MongoTemplate(MongoClients.create("mongodb+srv://issamajd00:4XZqgdKrq74OP9wm@freelancers.x303l.mongodb.net/?retryWrites=true&w=majority&appName=freelancers"), "freenlancers");
    }
}
