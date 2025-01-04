class Freelancer {
  final String id;
  final String name;
  final String location;
  final List<String> skills;
  final double hourlyRate;
  final double rating;
  final bool availability;
  final List<PortfolioItem> portfolio;

  Freelancer({
    required this.id,
    required this.name,
    required this.location,
    required this.skills,
    required this.hourlyRate,
    required this.rating,
    required this.portfolio,
    required this.availability,
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      id: json['id'] ?? '', // Default empty string if id is null
      name: json['name'] ?? 'Unknown', // Default placeholder for name
      location: json['location'] ?? 'Unknown Location', // Default location
      skills: List<String>.from(json['skills'] ?? []), // Empty list if null
      hourlyRate: (json['hourlyRate'] ?? 0).toDouble(), // Default 0.0 if null
      rating: (json['rating'] ?? 0).toDouble(), // Default 0.0 if null
      portfolio: (json['portfolio'] as List<dynamic>? ?? []) // Empty list if null
          .map((item) => PortfolioItem.fromJson(item))
          .toList(),
      availability: json['availability'] ?? false, // Default false if null
    );
  }
}

class PortfolioItem {
  final String projectName;
  final String description;

  PortfolioItem({
    required this.projectName,
    required this.description,
  });

  factory PortfolioItem.fromJson(Map<String, dynamic> json) {
    return PortfolioItem(
      projectName: json['projectName'] ?? 'Unknown Project', // Default project name
      description: json['description'] ?? 'No description available.', // Default description
    );
  }
}
