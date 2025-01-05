# Freelancer Search Platform



https://github.com/user-attachments/assets/370a5219-b5b6-4fcd-b8db-c7e0f69bd528



## Overview
This project is a **Freelancer Search Platform** designed to help users find freelancers based on skills, portfolio projects, and ratings. The platform provides a user-friendly interface to search, view, and filter freelancer profiles dynamically.

## Features
- **Search by Skill**: Users can search freelancers by specific skills.
- **Search by Portfolio Projects**: Users can find freelancers who have worked on particular types of projects.
- **Search by Rating**: Users can filter freelancers based on their ratings.
- **Responsive UI**: Clean and responsive interface built using Flutter.

## Technology Stack

### Backend:
- **Language**: Java
- **Framework**: Spring Boot
- **Database**: MongoDB (with Atlas Search)

### Frontend:
- **Technology**: Flutter
- **AJAX**: To interact with the backend APIs dynamically

### Tools:
- **Dependency Management**: Maven
- **Database Management**: MongoDB Atlas
- **IDE**: IntelliJ

## Installation and Setup

### Prerequisites
- Java 11 or higher
- Maven
- MongoDB Atlas account
- Flutter SDK

### Steps to Run

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/MajdIssa34/Freelacing.git
   cd Freelancing
   ```

2. **Setup Environment Variables**:
   Configure your `application.properties` file in the `src/main/resources` directory to add your MongoDB credentials:
   ```properties
   spring.data.mongodb.uri=mongodb+srv://username:password@cluster.mongodb.net/dbname
   ```

3. **Build and Run the Backend**:
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

4. **Launch the Flutter Frontend**:
   In the Flutter project directory, run:
   ```bash
   flutter run
   ```

## Usage

### Searching Freelancers
1. Open the application in your Flutter app.
2. Enter search criteria in the form (e.g., skills, portfolio project name, or rating).
3. Click on the **Search** button.
4. View the search results dynamically displayed below the form.

### API Endpoints

#### 1. **Search Freelancers**
   - **Endpoint**: `/api/freelancers/search`
   - **Method**: GET
   - **Query Parameters**:
     - `skill` (optional): Search by skill (e.g., `Java`).
     - `portfolio` (optional): Search by portfolio project name.
     - `rating` (optional): Filter by rating (e.g., `4.5`).
   - **Response**:
     ```json
     [
       {
         "id": "6771d5967aa42982fa6a9413",
         "name": "Alex Johnson",
         "location": "Los Angeles, USA",
         "skills": ["JavaScript", "React", "Node.js"],
         "hourlyRate": 45,
         "rating": 4.9,
         "availability": true,
         "portfolio": [
           {
             "projectName": "E-commerce Platform",
             "description": "Built a full-stack e-commerce website using React and Node.js.",
             "url": "https://alexportfolio.com/ecommerce"
           }
         ]
       }
     ]
     ```

## Contributing
1. Fork the repository.
2. Create a new branch for your feature: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin feature-name`.
5. Open a pull request.

## Acknowledgments
- MongoDB Atlas Search for powering the search functionality.
- Spring Boot for robust backend development.
- Flutter for a modern, responsive frontend.
- Open-source contributors and documentation.
