package com.majd.freelancing.repository;

import com.majd.freelancing.module.FreelancerModel;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface FreelancerRepository extends MongoRepository<FreelancerModel, String> {

}
