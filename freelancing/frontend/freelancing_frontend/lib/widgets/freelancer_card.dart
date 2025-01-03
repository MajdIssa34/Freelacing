import 'package:flutter/material.dart';
import 'package:freelancing_frontend/models/freelancer.dart';

class FreelancerCard extends StatelessWidget {
  final Freelancer freelancer;

  FreelancerCard({required this.freelancer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              freelancer.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Location: ${freelancer.location}'),
            Text('Skills: ${freelancer.skills.join(', ')}'),
            Text('Rating: ${freelancer.rating.toStringAsFixed(1)}'),
          ],
        ),
      ),
    );
  }
}
