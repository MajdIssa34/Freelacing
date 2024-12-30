package com.majd.freelancing.repository;

import com.majd.freelancing.module.FreelancerModel;

import java.util.List;

public interface SearchRepository {

    List<FreelancerModel> findBySkills(String text);
    List<FreelancerModel> findByAvailability(String text);
    List<FreelancerModel> findByProjects(String text);
    List<FreelancerModel> findByContact(String text);
    List<FreelancerModel> findBySkillsAndPortfolio(String skills, String portfolio);
    List<FreelancerModel> findByHourlyRate(Integer max);

}
