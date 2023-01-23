import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miniproject/data/model/article.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '6d31f4c1ab7d42e49634c64cc65675a3';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse("${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}