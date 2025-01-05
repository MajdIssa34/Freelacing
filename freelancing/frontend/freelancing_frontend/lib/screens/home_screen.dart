import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freelancing_frontend/constants/my_button.dart';
import 'package:freelancing_frontend/constants/text_field.dart';
import 'search_results_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _inputController = TextEditingController();
  String _selectedSearchType = 'Skill'; // Default search type

  void _searchFreelancers() {
    final input = _inputController.text.trim();

    final queryParams = {
      if (input.isEmpty) _selectedSearchType.toLowerCase(): "",
      if (input.isNotEmpty) _selectedSearchType.toLowerCase(): input,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(queryParameters: queryParams),
      ),
    );
  }

  void _searchFreelancers2(String searchType, String text){
    final queryParams = {
      searchType: text
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
          "FREE LANCER SEARCH",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              //fontSize: 45,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.green.shade900.withOpacity(0.2),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Row(
            children: [
              // Column containing text, dropdown, input, and button
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Heading text
                    Text(
                      "Hire Experts For Your Projects",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                        height: 20), // Spacing between heading and search bar
                    // Row for dropdown, input, and button
                    Row(
                      children: [
                        DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          alignment: Alignment.topLeft,
                          value: _selectedSearchType,
                          onChanged: (value) {
                            setState(() {
                              _selectedSearchType = value!;
                            });
                          },
                          items: ['Skill', 'Portfolio', 'Rating']
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ))
                              .toList(),
                          dropdownColor: Colors.green.shade800,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 2,
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: _buildFuturisticTextField(
                              controller: _inputController,
                              label: 'Enter $_selectedSearchType',
                              keyboardType: _selectedSearchType == 'Rating'
                                  ? TextInputType.number
                                  : TextInputType.text,
                            ),
                          ),
                        ),
                        MyButton(onTap: _searchFreelancers, str: "Search"),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Suggested Searches:",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,              
                          ),
                        ),
                        MyButton(onTap: (){ _searchFreelancers2("skill", "Java");}, str: "Java"),
                        MyButton(onTap: (){_searchFreelancers2("portfolio", "Web");}, str: "Web Developer"),
                        MyButton(onTap: (){_searchFreelancers2("rating", "4.5");}, str: "> 4.5 Stars"),
                      ],
                    )
                  ],
                ),
              ),
              // Image
              Container(
                width: 400, // Adjust this value to make the image smaller
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/BG.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFuturisticTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return MyTextField(
      controller: controller,
      keyboardType: keyboardType,
      hintText: Text(label),
    );
  }
}
