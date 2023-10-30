import 'package:flutter/material.dart';
import 'package:news_api_app/Model/news_model.dart';
import 'package:news_api_app/View/news_detail.dart';
import 'package:news_api_app/Widget/spacing.dart';
import 'package:get/get.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;

  const NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const NewsDetail(), arguments: newsModel);
      },
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Image.network(
                  newsModel.urlToImage.toString(),
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, exception, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image));
                  },
                ),
              ),
              verticalSpace(8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(newsModel.source!.name.toString(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                  horizontalSpace(8),
                  Text(newsModel.publishedAt.toString())
                ],
              ),
              verticalSpace(5),
              Text(
                  newsModel.author == null
                      ? 'Unknown Writer'
                      : "Written by ${newsModel.author}",
                  style: const TextStyle(decoration: TextDecoration.underline)),
              verticalSpace(8),
              Text(newsModel.title.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
