import 'package:book_store_provider/core/failur/failur.dart';
import 'package:book_store_provider/core/utils/api_servise.dart';
import 'package:book_store_provider/feature/home/data/model/book/book.model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBookProvider with ChangeNotifier {
  final List<BookModel> _books = [];

  List<BookModel> get books => _books;

  ApiServise apiServise = ApiServise(Dio());

  Future<void> fetchSearchdBooks({required String? bookName}) async {
    try {
      Map<String, dynamic> data = await apiServise.get(
          endPoint: "volumes?q=subject:programming&Filtering=free-ebooks");
      _books.clear();
      for (Map<String, dynamic> item in data["items"]) {
        if (item["volumeInfo"]["title"].contains(bookName ?? "a")) {
          _books.add(BookModel.fromJson(item));
        }
      }
      notifyListeners();
    } catch (e) {
      Get.snackbar("Error", "${ServerFailur(e.toString())}");
    }
  }
}
