import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_app/Controller/news_controller.dart';
import 'package:news_api_app/Widget/news_item_list.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.newsModel.length,
            itemBuilder: (context, index) =>
                NewsItemList(newsModel: controller.newsModel[index]),
          );
        }
      }),
    );
  }
}
