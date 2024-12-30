document.addEventListener("DOMContentLoaded", () => {
    const searchForm = document.getElementById("searchForm");
    const resultsSection = document.querySelector(".results-section");
    const resultsDiv = document.getElementById("results");

    searchForm.addEventListener("submit", async (e) => {
        e.preventDefault();

        // Clear previous results
        resultsDiv.innerHTML = "";
        resultsSection.style.display = "none";

        // Get form data
        const skill = document.getElementById("skill").value.trim();
        const portfolio = document.getElementById("portfolio").value.trim();
        const rating = document.getElementById("rating").value.trim();

        // Build the query parameters
        const queryParams = new URLSearchParams();
        if (skill) queryParams.append("skill", skill);
        if (portfolio) queryParams.append("portfolio", portfolio);
        if (rating) queryParams.append("rating", rating);

        try {
            // Make API call
            const response = await fetch(`/search?${queryParams.toString()}`);
            if (!response.ok) {
                throw new Error("Failed to fetch data");
            }

            const freelancers = await response.json();

            if (freelancers.length === 0) {
                resultsDiv.innerHTML = "<p>No freelancers found matching your criteria.</p>";
            } else {
                freelancers.forEach(freelancer => {
                    const div = document.createElement("div");
                    div.classList.add("result-item");
                    div.innerHTML = `
                        <h3>${freelancer.name}</h3>
                        <p><strong>Location:</strong> ${freelancer.location}</p>
                        <p><strong>Skills:</strong> ${freelancer.skills.join(", ")}</p>
                        <p><strong>Rating:</strong> ${freelancer.rating}</p>
                        <p><strong>Hourly Rate:</strong> $${freelancer.hourlyRate}/hr</p>
                        <p><strong>Portfolio:</strong></p>
                        <ul>
                            ${freelancer.portfolio.map(project => `
                                <li>
                                    <a href="${project.url}" target="_blank">${project.projectName}</a> - ${project.description}
                                </li>
                            `).join("")}
                        </ul>
                    `;
                    resultsDiv.appendChild(div);
                });
            }

            resultsSection.style.display = "block";
        } catch (error) {
            resultsDiv.innerHTML = `<p>Error: ${error.message}</p>`;
            resultsSection.style.display = "block";
        }
    });
});
