import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/freelancer.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8081/api';
  Uri uri = Uri.parse("");

  Future<List<Freelancer>> searchFreelancers(Map<String, String> queryParams) async {
    if(queryParams.containsValue("")){
      uri = Uri.parse('$baseUrl/freelancers/all');
    }else{
      uri = Uri.parse('$baseUrl/freelancers/search').replace(queryParameters: queryParams);
    }
    print(uri);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Freelancer.fromJson(json)).toList();
    } else {
      
      throw Exception('Failed to fetch freelancers');
    }
  }

  bool isEmpty(Map<String, String> queryParams){
    if(queryParams['skill'] =="" && queryParams['portfolio'] =="" && queryParams['rating'] ==""){
      return true;
    }
    return false;
  }

}