package com.majd.freelancing.service;

import com.majd.freelancing.module.FreelancerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FreelancerService {

    @Autowired
    private FreelancerRepository freelancerRepository;

    public List<FreelancerModel> searchBySkill(String skill) {
        return freelancerRepository.findBySkill(skill);
    }

    public List<FreelancerModel> searchByPortfolio(String projectName) {
        return freelancerRepository.findByPortfolioProject(projectName);
    }

    public List<FreelancerModel> searchByRating(Double rating) {
        return freelancerRepository.findByRating(rating);
    }

    public List<FreelancerModel> searchBySkillAndPortfolioAndRating(String skill, String projectName, Double rating) {
        return freelancerRepository.findBySkillAndPortfolioAndRating(skill, projectName, rating);
    }
}
