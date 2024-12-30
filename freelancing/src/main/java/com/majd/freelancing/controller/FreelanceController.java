package com.majd.freelancing.controller;

import com.majd.freelancing.repository.FreelancerRepository;
import com.majd.freelancing.module.FreelancerModel;
import com.majd.freelancing.repository.SearchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class FreelanceController {

    @Autowired
    FreelancerRepository repo;
    @Autowired
    SearchRepository searchRepo;

    @GetMapping("/freelancers")
    public List<FreelancerModel> getAllFreelancers(){
        return repo.findAll();
    }

    @GetMapping("/skills/{text}")
    public List<FreelancerModel> searchBySkills(@PathVariable String text){
        return searchRepo.findBySkills(text);
    }

    @PostMapping("/post")
    public FreelancerModel addPost(@RequestBody FreelancerModel freelancerModel){
        return repo.save(freelancerModel);
    }

    @GetMapping("/project/{text}")
    public List<FreelancerModel> searchByProjects(@PathVariable String text){
        return searchRepo.findByProjects(text);
    }
    @GetMapping("/skillsProjects/{text}/{portfolio}")
    public List<FreelancerModel> searchBySkillsAndPortfolio(
            @PathVariable String text,
            @PathVariable String portfolio) {
        return searchRepo.findBySkillsAndPortfolio(text, portfolio);
    }

    @GetMapping("/rating/{rating}")
    public List<FreelancerModel> searchByRating(@PathVariable Double rating){
        return searchRepo.findByRating(rating);
    }
}
