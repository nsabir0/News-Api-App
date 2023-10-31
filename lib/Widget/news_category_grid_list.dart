import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsCategory extends StatefulWidget {
  const NewsCategory({super.key});

  @override
  State<NewsCategory> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  var isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Obx(() => Container(
          color: isSelected.value
              ? Colors.red
              : Colors.green,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child:  ElevatedButton(
                  onPressed: () {
                    isSelected.value != isSelected.value;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected.value
                        ? Colors.deepPurple[300]
                        : Colors.red, // Background color
                  ),
                  child: const Text('Country')),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 5,
        childAspectRatio: 8 / 20,
      ),
    );
  }
}
