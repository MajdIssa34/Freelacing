import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      if (rating.isEmpty && portfolio.isEmpty && rating.isEmpty)'skill': "", 'portfolio': "", 'rating': "",
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(queryParameters: queryParams),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Freelancer Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _skillController,
              decoration: InputDecoration(
                labelText: 'Skill',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _portfolioController,
              decoration: InputDecoration(
                labelText: 'Portfolio Project',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(
                labelText: 'Rating',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchFreelancers,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blueAccent,
              ),
              child: Text(
                'Search Freelancers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
