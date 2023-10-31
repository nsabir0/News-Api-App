import 'package:flutter/material.dart';
import 'package:news_api_app/Model/news_model.dart';
import 'package:news_api_app/View/news_detail.dart';
import 'package:news_api_app/Widget/spacing.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  newsModel.urlToImage.toString(),
                  fit: BoxFit.cover,
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
              verticalSpace(8.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.dg),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(newsModel.source!.name.toString(),
                        style: const TextStyle(color: Colors.white)),
                  ),
                  horizontalSpace(8.w),
                  Text(
                    newsModel.publishedAt.toString(),
                    style: TextStyle(fontSize: 12.w),
                  )
                ],
              ),
              verticalSpace(5.h),
              Text(
                  newsModel.author == null
                      ? 'Unknown Writer'
                      : "Written by ${newsModel.author}",
                  style: const TextStyle(decoration: TextDecoration.underline)),
              verticalSpace(8.h),
              Text(newsModel.title.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
