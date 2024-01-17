import 'package:get/get.dart';
import 'package:news_api_app/Model/news_model.dart';
import 'package:news_api_app/Service/api_service.dart';

class BreakingNewsController extends GetxController {
  var isLoading = true.obs;
  var isSelected = false.obs;
  var selectedIndex = 0.obs;

  List category = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
  var newsModel = List<NewsModel>.empty().obs;
  ApiService apiService = ApiService();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    try {
      isLoading(true);
      var data = await apiService.getBreakingNews();
      newsModel.assignAll(data);
    } finally {
      isLoading(false);
    }
  }
}
