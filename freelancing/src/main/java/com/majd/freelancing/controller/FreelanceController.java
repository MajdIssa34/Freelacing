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

    @GetMapping("/posts/{text}")
    public List<FreelancerModel> search(@PathVariable String text){
        return searchRepo.findBySkills(text);
    }

    @PostMapping("/post")
    public FreelancerModel addPost(@RequestBody FreelancerModel freelancerModel){
        return repo.save(freelancerModel);
    }
}
