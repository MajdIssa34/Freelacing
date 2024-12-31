package com.majd.freelancing.repository;

import com.majd.freelancing.module.FreelancerModel;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.List;

public interface FreelancerRepository extends MongoRepository<FreelancerModel, String> {

    // Search by skills
    @Query("{ 'skills': { $regex: ?0, $options: 'i' } }")
    List<FreelancerModel> findBySkill(String skill);

    // Search by portfolio project name
    @Query("{ 'portfolio.projectName': { $regex: ?0, $options: 'i' } }")
    List<FreelancerModel> findByPortfolioProject(String projectName);

    // Search by rating
    @Query("{ 'rating': { $gte: ?0 } }")
    List<FreelancerModel> findByRating(Double rating);

    // Search by skills, portfolio, and rating
    @Query("{ $and: [ " +
            "{ 'skills': { $regex: ?0, $options: 'i' } }, " +
            "{ 'portfolio.projectName': { $regex: ?1, $options: 'i' } }, " +
            "{ 'rating': { $gte: ?2 } } ] }")
    List<FreelancerModel> findBySkillAndPortfolioAndRating(String skill, String projectName, Double rating);
}
