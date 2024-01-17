import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_api_app/Controller/breaking_news_controller.dart';
import 'package:news_api_app/View/test.dart';

class NewsCategory extends StatefulWidget {
  const NewsCategory({super.key});

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  BreakingNewsController controller = Get.put(BreakingNewsController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.category.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 5,
        childAspectRatio: 8 / 28,
      ),
      itemBuilder: (context, index) {
        return Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: ElevatedButton(
                onPressed: () {
                  controller.isSelected.value = !controller.isSelected.value;
                  controller.selectedIndex.value = index;
                  Get.to(() => const PopoverExample());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: controller.selectedIndex.value == index
                        ? (controller.isSelected.value
                            ? Colors.deepPurple[300]
                            : Colors.blue)
                        : Colors.red),
                child: Text(controller.category[index])),
          ),
        );
      },
    );
  }
}
