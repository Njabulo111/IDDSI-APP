import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodService {
  // Update this URL to match your Firebase backend URL
  final String baseUrl = 'https://localhost:7001/api/FoodLibrary'; // For local development
  // final String baseUrl = 'https://your-production-url/api/FoodLibrary'; // For production

  Future<List<Map<String, dynamic>>> searchFood(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search?name=${Uri.encodeComponent(query)}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print('Search failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to search food: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Search error: $e');
      throw Exception('Error searching food: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getFoodByIDDSILevel(int level) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/iddsi-level/$level'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print('Get by IDDSI level failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to get food by IDDSI level: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Get by IDDSI level error: $e');
      throw Exception('Error getting food by IDDSI level: $e');
    }
  }
}




 