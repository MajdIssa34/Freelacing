// Base URL of your backend API
const API_BASE_URL = 'http://localhost:8081/api/freelancers';
console.log(document.getElementById('searchButton'));
// Function to fetch and display results
async function searchFreelancers() {
    // Get input values from the form
    const skill = document.getElementById('skillInput').value;
    const projectName = document.getElementById('projectInput').value;
    const rating = document.getElementById('ratingInput').value;

    // Build the query string
    const queryParams = new URLSearchParams();
    if (skill) queryParams.append('skill', skill);
    if (projectName) queryParams.append('projectName', projectName);
    if (rating) queryParams.append('rating', rating);

    try {
        // Send the GET request
        const response = await fetch(`${API_BASE_URL}/search?${queryParams}`);
        const freelancers = await response.json();

        // Display the results
        displayResults(freelancers);
    } catch (error) {
        console.error('Error fetching freelancers:', error);
    }
}

// Function to display results in the UI
function displayResults(freelancers) {
    const resultsContainer = document.getElementById('results');
    resultsContainer.innerHTML = ''; // Clear previous results

    if (freelancers.length === 0) {
        resultsContainer.innerHTML = '<p>No freelancers found.</p>';
        return;
    }

    freelancers.forEach(freelancer => {
        // Create a card for each freelancer
        const card = document.createElement('div');
        card.className = 'freelancer-card';

        card.innerHTML = `
            <h3>${freelancer.name}</h3>
            <p><strong>Location:</strong> ${freelancer.location}</p>
            <p><strong>Skills:</strong> ${freelancer.skills.join(', ')}</p>
            <p><strong>Rating:</strong> ${freelancer.rating}</p>
            <p><strong>Availability:</strong> ${freelancer.availability ? 'Available' : 'Not Available'}</p>
            <h4>Portfolio:</h4>
            <ul>
                ${freelancer.portfolio.map(project => `
                    <li>
                        <strong>${project.projectName}</strong>: ${project.description}
                        <br><a href="${project.url}" target="_blank">View Project</a>
                    </li>
                `).join('')}
            </ul>
        `;

        resultsContainer.appendChild(card);
    });
}

document.addEventListener('DOMContentLoaded', () => {
    console.log('DOM fully loaded and parsed');

    const searchButton = document.getElementById('searchButton');
    console.log(searchButton); // Should log the button element

    if (searchButton) {
        searchButton.addEventListener('click', (event) => {
            event.preventDefault();
            console.log('Search button clicked'); // Debug statement
            searchFreelancers();
        });
    } else {
        console.error('Search button not found!');
    }
});

