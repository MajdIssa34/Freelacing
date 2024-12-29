package com.majd.freelancing.repository;

import com.majd.freelancing.module.FreelancerModel;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.convert.MongoConverter;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class SearchRepoImplementation implements SearchRepository{

    @Autowired
    MongoClient mongoClient;

    @Autowired
    MongoConverter mongoConverter;

    @Override
    public List<FreelancerModel> findByText(String text) {

        final List<FreelancerModel> freelancers = new ArrayList<>();

        MongoDatabase database = mongoClient.getDatabase("freenlancers");
        MongoCollection<Document> collection = database.getCollection("freelancePosts");
        AggregateIterable<Document> result = collection.aggregate(Arrays.asList(new Document("$search",
                        new Document("index", "default").append("text",
                                new Document("query", text).append("path", Arrays.asList("skills", "portfolio")))),
                new Document("$sort",
                        new Document("rating", -1L)),
                new Document("$sort",
                        new Document("hourly_rate", 1L)),
                new Document("$limit", 5L)));

        result.forEach(doc -> freelancers.add(mongoConverter.read(FreelancerModel.class, doc)));

        return freelancers;

    }
}
