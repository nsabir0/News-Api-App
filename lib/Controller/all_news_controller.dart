import 'package:get/get.dart';
import 'package:news_api_app/Model/news_model.dart';
import 'package:news_api_app/Service/api_service.dart';


class AllNewsController extends GetxController {
  var isLoading = true.obs;
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
      var data = await apiService.getAllNews();
      newsModel.assignAll(data);
    } finally {
      isLoading(false);
    }
  }
}