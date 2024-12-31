package com.majd.freelancing.controller;

import com.majd.freelancing.FreelancerService;
import com.majd.freelancing.repository.FreelancerRepository;
import com.majd.freelancing.module.FreelancerModel;
import com.majd.freelancing.repository.SearchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/freelancers")
@CrossOrigin(origins = "*") // Allow all origins
public class FreelancerController {

    @Autowired
    private FreelancerService freelancerService;

    @GetMapping("/searchBySkill")
    public List<FreelancerModel> searchBySkill(@RequestParam String skill) {
        return freelancerService.searchBySkill(skill);
    }

    @GetMapping("/searchByPortfolio")
    public List<FreelancerModel> searchByPortfolio(@RequestParam String projectName) {
        return freelancerService.searchByPortfolio(projectName);
    }

    @GetMapping("/searchByRating")
    public List<FreelancerModel> searchByRating(@RequestParam Double rating) {
        return freelancerService.searchByRating(rating);
    }

    @GetMapping("/search")
    public List<FreelancerModel> searchBySkillAndPortfolioAndRating(
            @RequestParam(required = false) String skill,
            @RequestParam(required = false) String projectName,
            @RequestParam(required = false) Double rating
    ) {
        return freelancerService.searchBySkillAndPortfolioAndRating(
                skill != null ? skill : "",
                projectName != null ? projectName : "",
                rating != null ? rating : 0.0
        );
    }
}

