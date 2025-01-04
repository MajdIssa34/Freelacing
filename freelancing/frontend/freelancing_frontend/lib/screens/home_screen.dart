import 'package:flutter/material.dart';
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
      if(input.isEmpty) _selectedSearchType.toLowerCase(): "",
      if(input.isNotEmpty) _selectedSearchType.toLowerCase():
          input, // Use the selected search type as the key  
    };
    print(queryParams);

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
        backgroundColor: Colors.green.shade800,
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
                          child: Text(type),
                        ))
                    .toList(),
                dropdownColor: Colors.green.shade800,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 400, // Adjust this value to make the image smaller
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/BG.png"),
                    fit: BoxFit
                        .contain, // Adjust how the image scales within the container
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
