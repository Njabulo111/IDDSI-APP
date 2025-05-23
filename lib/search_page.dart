import 'package:flutter/material.dart';
import '../services/food_service.dart';
import '../models/food.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> suggestions = [
    "Banana", "Jelly", "Pap",
    "Tea", "Samp", "Soft vegetables", "Rice"
  ];

  String query = "";
  final TextEditingController _searchController = TextEditingController();
  final FoodService _foodService = FoodService();
  List<Food> _searchResults = [];
  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _selectSuggestion(String suggestion) {
    setState(() {
      query = suggestion;
      _searchController.text = suggestion;
    });
    _performSearch(suggestion);
  }

  Future<void> _performSearch(String searchQuery) async {
    if (searchQuery.isEmpty) {
      setState(() {
        _searchResults = [];
        _error = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final results = await _foodService.searchFood(searchQuery);
      setState(() {
        _searchResults = results.map((json) => Food.fromJson(json)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/iddsi-logo.png',
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for foods...",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            query = "";
                            _searchController.clear();
                            _searchResults = [];
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
                _performSearch(value);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Search suggestions:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF4C7378),
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: suggestions.map((item) {
                return ActionChip(
                  label: Text(
                    item,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: Colors.lightBlue,
                  pressElevation: 2,
                  onPressed: () => _selectSuggestion(item),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            if (query.isNotEmpty) ...[
              const Text(
                "Search Results:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF4C7378),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _error != null
                          ? Center(
                              child: Text(
                                _error!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )
                          : _searchResults.isEmpty
                              ? const Center(
                                  child: Text(
                                    'No results found',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: _searchResults.length,
                                  itemBuilder: (context, index) {
                                    final food = _searchResults[index];
                                    return Card(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: ListTile(
                                        title: Text(food.foodName),
                                        subtitle: Text('IDDSI Level: ${food.iddsiLevelId}'),
                                        trailing: Text(
                                          'Rating: ${food.averageRating.toStringAsFixed(1)}',
                                          style: const TextStyle(
                                            color: Colors.lightBlue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}