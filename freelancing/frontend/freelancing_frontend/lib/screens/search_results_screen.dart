import 'package:flutter/material.dart';
import 'package:freelancing_frontend/models/freelancer.dart';
import 'package:freelancing_frontend/widgets/freelancer_card.dart';
import 'package:freelancing_frontend/services/api_service.dart';

class SearchResultsScreen extends StatelessWidget {
  final Map<String, String> queryParameters;

  SearchResultsScreen({required this.queryParameters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: FutureBuilder<List<Freelancer>>(
        future: ApiService().searchFreelancers(queryParameters),
        builder: (context, snapshot) {         
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: SelectableText('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No freelancers found.'));
          } else {
            final freelancers = snapshot.data!; 
            print(freelancers.length);         
            return ListView.builder(
              
              itemCount: freelancers.length,
              itemBuilder: (context, index) {
                return FreelancerCard(freelancer: freelancers[index]);
              },
            );
          }
        },
      ),
    );
  }
}
