import 'package:flutter/material.dart';
import 'package:freelancing_frontend/models/freelancer.dart';
import 'package:freelancing_frontend/widgets/freelancer_card.dart';
import 'package:freelancing_frontend/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultsScreen extends StatelessWidget {
  final Map<String, dynamic> queryParameters;

  SearchResultsScreen({required this.queryParameters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade800,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Results for your search:",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: FutureBuilder<List<Freelancer>>(
                  future: ApiService().searchFreelancers(queryParameters),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.green.shade800,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: SelectableText(
                          'Error: ${snapshot.error}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No freelancers found.',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      final freelancers = snapshot.data!;
                      return ListView.builder(
                        itemCount: freelancers.length,
                        itemBuilder: (context, index) {
                          return FreelancerCard(freelancer: freelancers[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
