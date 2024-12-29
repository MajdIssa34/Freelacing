package com.majd.freelancing.repository;

import com.majd.freelancing.module.FreelancerModel;

import java.util.List;

public interface SearchRepository {

    List<FreelancerModel> findByText(String text);

}
