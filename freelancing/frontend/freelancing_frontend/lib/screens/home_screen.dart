import 'package:flutter/material.dart';
import 'search_results_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _skillController = TextEditingController();
  final _portfolioController = TextEditingController();
  final _ratingController = TextEditingController();

  void _searchFreelancers() {
    final skill = _skillController.text.trim();
    final portfolio = _portfolioController.text.trim();
    final rating = _ratingController.text.trim();

    final queryParams = {
      if (skill.isNotEmpty) 'skill': skill,
      if (portfolio.isNotEmpty) 'portfolio': portfolio,
      if (rating.isNotEmpty) 'rating': rating,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(queryParameters: queryParams,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Freelancer Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _skillController,
              decoration: InputDecoration(labelText: 'Skill'),
            ),
            TextField(
              controller: _portfolioController,
              decoration: InputDecoration(labelText: 'Portfolio Project'),
            ),
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchFreelancers,
              child: Text('Search Freelancers'),
            ),
          ],
        ),
      ),
    );
  }
}