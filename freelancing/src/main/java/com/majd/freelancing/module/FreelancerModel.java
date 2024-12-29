package com.majd.freelancing.module;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document(collection = "freelancePosts")
public class FreelancerModel {
    @Id
    private String id;
    private String name;
    private String location;
    private List<String> skills;
    private double hourlyRate;
    private double rating;
    private List<Portfolio> portfolio;
    private boolean availability;

    // Nested class for Portfolio
    public static class Portfolio {
        private String projectName;
        private String description;
        private String url;

        public Portfolio() {}

        public Portfolio(String projectName, String description, String url) {
            this.projectName = projectName;
            this.description = description;
            this.url = url;
        }

        public String getProjectName() {
            return projectName;
        }

        public void setProjectName(String projectName) {
            this.projectName = projectName;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }

    public FreelancerModel() {}

    public FreelancerModel(String id, String name, String location, List<String> skills, double hourlyRate, double rating, List<Portfolio> portfolio, boolean availability) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.skills = skills;
        this.hourlyRate = hourlyRate;
        this.rating = rating;
        this.portfolio = portfolio;
        this.availability = availability;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }

    public double getHourlyRate() {
        return hourlyRate;
    }

    public void setHourlyRate(double hourlyRate) {
        this.hourlyRate = hourlyRate;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public List<Portfolio> getPortfolio() {
        return portfolio;
    }

    public void setPortfolio(List<Portfolio> portfolio) {
        this.portfolio = portfolio;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }
}
