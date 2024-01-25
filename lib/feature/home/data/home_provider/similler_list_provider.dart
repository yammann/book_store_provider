import 'package:book_store_provider/core/failur/failur.dart';
import 'package:book_store_provider/core/utils/api_servise.dart';
import 'package:book_store_provider/feature/home/data/model/book/book.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimillerListProvider with ChangeNotifier {
  final List<BookModel> _books = [];

  List<BookModel> get books => _books;

  ApiServise apiServise = ApiServise(Dio());

  Future<void> fetchSimillerdBooks({required String? categore}) async {
    try {
      Map<String, dynamic> data = await apiServise.get(
          endPoint:
              "volumes?q=subject:${categore ?? "programming"}&Filtering=free-ebooks&Sorting=relevance");
      _books.clear();
      if (data["items"] != null) {
        for (var item in data["items"]) {
          _books.add(BookModel.fromJson(item));
        }
      }
      notifyListeners();
    } catch (e) {
      print("wwwwwwwww1");
      Get.snackbar("Error", "${ServerFailur(e.toString())}");
    }
  }
}
