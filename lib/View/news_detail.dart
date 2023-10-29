import 'package:flutter/material.dart';
import 'package:news_api_app/Model/news_model.dart';

class NewsDetail extends StatefulWidget {
  final NewsModel newsModel;
   const NewsDetail({super.key, required this.newsModel});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
