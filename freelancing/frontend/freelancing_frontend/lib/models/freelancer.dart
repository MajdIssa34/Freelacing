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
    required this.availability,
    required this.portfolio,
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      skills: List<String>.from(json['skills']),
      hourlyRate: json['hourlyRate'] as double,
      rating: json['rating'] as double,
      availability: json['availability'] as bool,
      portfolio: (json['portfolio'] as List<dynamic>)
          .map((item) => PortfolioItem.fromJson(item))
          .toList(),
    );
  }
}

class PortfolioItem {
  final String projectName;
  final String description;
  final String url;

  PortfolioItem({
    required this.projectName,
    required this.description,
    required this.url,
  });

  factory PortfolioItem.fromJson(Map<String, dynamic> json) {
    return PortfolioItem(
      projectName: json['projectName'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );
  }
}
