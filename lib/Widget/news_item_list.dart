import 'package:cached_network_image/cached_network_image.dart';
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
        print(newsModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: newsModel.urlToImage.toString(),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
              newsModel.author == null ? '' : "Written by ${newsModel.author}"),
          verticalSpace(8),
          Text(newsModel.title.toString()),
        ],
      ),
    );
  }
}
