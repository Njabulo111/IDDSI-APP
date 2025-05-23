import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodService {
  final String baseUrl = 'https://your-api-url/api/FoodLibrary'; // Replace with your actual API URL

  Future<List<Map<String, dynamic>>> searchFood(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search?name=$query'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to search food: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching food: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getFoodByIDDSILevel(int level) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/iddsi-level/$level'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to get food by IDDSI level: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting food by IDDSI level: $e');
    }
  }
}