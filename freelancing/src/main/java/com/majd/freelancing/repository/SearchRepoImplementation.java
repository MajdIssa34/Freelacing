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
    public List<FreelancerModel> findBySkills(String text) {

        final List<FreelancerModel> freelancers = new ArrayList<>();

        MongoDatabase database = mongoClient.getDatabase("freenlancers");
        MongoCollection<Document> collection = database.getCollection("freelancePosts");
        AggregateIterable<Document> result = collection.aggregate(Arrays.asList(new Document("$search",
                new Document("index", "default")
                        .append("text",
                                new Document("query", text)
                                        .append("path", "skills")))));

        result.forEach(doc -> freelancers.add(mongoConverter.read(FreelancerModel.class, doc)));

        return freelancers;

    }

    @Override
    public List<FreelancerModel> findByProjects(String text) {

        final List<FreelancerModel> freelancers = new ArrayList<>();

        MongoDatabase database = mongoClient.getDatabase("freenlancers");
        MongoCollection<Document> collection = database.getCollection("freelancePosts");
        AggregateIterable<Document> result = collection.aggregate(Arrays.asList(new Document("$search",
                new Document("index", "default")
                        .append("text",
                                new Document("query", text)
                                        .append("path", "portfolio.projectName")))));

        result.forEach(doc -> freelancers.add(mongoConverter.read(FreelancerModel.class, doc)));

        return freelancers;
    }

    @Override
    public List<FreelancerModel> findBySkillsAndPortfolio(String skills, String portfolio) {

        final List<FreelancerModel> freelancers = new ArrayList<>();

        MongoDatabase database = mongoClient.getDatabase("freenlancers");
        MongoCollection<Document> collection = database.getCollection("freelancePosts");
        AggregateIterable<Document> result = collection.aggregate(Arrays.asList(new Document("$search",
                new Document("index", "default")
                        .append("compound",
                                new Document("must", Arrays.asList(new Document("text",
                                                new Document("query", skills)
                                                        .append("path", "skills")),
                                        new Document("text",
                                                new Document("query", portfolio)
                                                        .append("path", "portfolio.projectName"))))))));

        result.forEach(doc -> freelancers.add(mongoConverter.read(FreelancerModel.class, doc)));

        return freelancers;
    }

    @Override
    public List<FreelancerModel> findByRating(Double max) {

        final List<FreelancerModel> freelancers = new ArrayList<>();

        MongoDatabase database = mongoClient.getDatabase("freenlancers");
        MongoCollection<Document> collection = database.getCollection("freelancePosts");
        AggregateIterable<Document> result = collection.aggregate(Arrays.asList(new Document("$search",
                new Document("index", "default")
                        .append("range",
                                new Document("path", "rating")
                                        .append("gte", max)))));

        result.forEach(doc -> freelancers.add(mongoConverter.read(FreelancerModel.class, doc)));

        return freelancers;
    }


}
