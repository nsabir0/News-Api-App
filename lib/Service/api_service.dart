import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_api_app/Model/news_model.dart';

class ApiService {
  final allNewsUrl =
      'https://newsapi.org/v2/everything?q=*&apiKey=f446a72ad3734790a0e039fcde1c2306';
  final breakingNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=science&category=technology&apiKey=f446a72ad3734790a0e039fcde1c2306';

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breakingNewsUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleList =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articleList;
      } else {
        throw ('No News Found.');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(allNewsUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleList =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articleList;
      } else {
        throw ('No News Found.');
      }
    } catch (e) {
      rethrow;
    }
  }
}
