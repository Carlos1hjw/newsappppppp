
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsappppppp/model/categorymodel.dart';

class CategoryController with ChangeNotifier {
  int? selectedCategory = 0;
  List<String> categories = [
    "Business",
    "Entertainment",
    "Health",
    "Nature",
    "Politics",
    "Sports",
    "Technology",
    "World"
  ];
  List<Article> newsTopics = [];
  bool isLoading = false;

  Future<void> getCategories({String? category}) async {
    String categoryData = category ?? 'business';

    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?category=$categoryData&apiKey=4ab1817e5da74dc2a06a26b7a163b4ce",
    );

    isLoading = true;
    notifyListeners();

    try {
      log('Fetching news for category: $categoryData');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final articles = SearchNews.fromJson(data).articles ?? [];
        newsTopics = articles;
        log('Fetched ${articles.length} articles for category: $categoryData');
      } else {
        log('Failed  with Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching news: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

 
}
