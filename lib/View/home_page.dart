import 'package:flutter/material.dart';
import 'package:news_api_app/View/all_news.dart';
import 'package:news_api_app/View/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('NEWS API APP'),
            bottom: TabBar(
                tabs: [Tab(text: 'Breaking News'), Tab(text: 'All News')]),
          ),
          body: TabBarView(children: [BreakingNews(), AllNews()]),
        ));
  }
}
