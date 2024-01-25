import 'package:book_store_provider/core/failur/failur.dart';
import 'package:book_store_provider/core/utils/api_servise.dart';
import 'package:book_store_provider/feature/home/data/model/book/book.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeListProvider with ChangeNotifier {
  final List<BookModel> _books = [];

  List<BookModel> get books => _books;

  ApiServise apiServise = ApiServise(Dio());

  Future<void> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data = await apiServise.get(
          endPoint: "volumes?q=subject:programming&Filtering=free-ebooks");
      _books.clear();
      for (var item in data["items"]) {
        _books.add(BookModel.fromJson(item));
      }
      notifyListeners();
    } catch (e) {
      print("home1");
      Get.snackbar("Error", "${ServerFailur(e.toString())}");
    }
  }

  
}
