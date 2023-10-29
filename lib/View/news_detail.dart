import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api_app/Model/news_model.dart';
import 'package:news_api_app/Widget/spacing.dart';
import 'package:url_launcher/url_launcher.dart';


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
        padding: const EdgeInsets.symmetric(horizontal: 10),
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

            Text(newsModel.author == null ? '' : "Written by ${newsModel.author}"),

            verticalSpace(8),

            Text(newsModel.title.toString()),

            verticalSpace(8),

            Text(newsModel.description.toString()),

            verticalSpace(8),
            
            ElevatedButton(onPressed: ()async{

              final Uri uri= Uri.parse(newsModel.url.toString());

              if(!await launchUrl(uri)){
                throw Exception('Could Not launch');
              }

            }, child: Text('Reade More...'))
          ],
        ),
      ),
    );
  }
}
