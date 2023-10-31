import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_app/Model/news_model.dart';
import 'package:news_api_app/Widget/spacing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  NewsModel newsModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsModel.title.toString())),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
        child: SingleChildScrollView(
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
                  Text(newsModel.publishedAt.toString())
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
              verticalSpace(8.h),
              Text(newsModel.description.toString()),
              verticalSpace(8.h),
              ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(newsModel.url.toString());

                    if (!await launchUrl(url)) {
                      throw Exception('Could Not launch');
                    }
                  },
                  child: const Text('Reade More...'))
            ],
          ),
        ),
      ),
    );
  }
}
