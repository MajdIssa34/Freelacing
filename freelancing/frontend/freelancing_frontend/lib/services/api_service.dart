import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/freelancer.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8081/api';

  Future<List<Freelancer>> searchFreelancers(Map<String, String> queryParams) async {
    final uri = Uri.parse('$baseUrl/freelancers/search').replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data);
      return data.map((json) => Freelancer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch freelancers');
    }
  }
}