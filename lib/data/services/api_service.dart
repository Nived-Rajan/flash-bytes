import 'package:flash_bytes/data/models/news_model.dart';
import 'package:flash_bytes/sportsCategory/category_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class APIService {
  Future<NewsModel?> fetchNews(String category,String date) async {

    final response = await http
        .get(Uri.parse('https://newsapi.org/v2/top-headlines?category=$category&country=in&from=$date&language=en&apiKey=0eb804e111d847deb9e335aa09081b5a'));

    if (response.statusCode == 200) {
      print('success');
      print(response.body);
      NewsModel newsModel = NewsModel.fromJson(jsonDecode(response.body));

      return newsModel;
    }
    else {
      print("error");
    }
  }
}

