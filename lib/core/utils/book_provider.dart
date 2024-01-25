import 'package:book_store_provider/feature/home/data/model/book/book.model.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  BookModel _bookModel = const BookModel();

  BookModel get bookmodel => _bookModel;

  set bookmodel(BookModel book) {
    _bookModel = book;
    notifyListeners();
  }
}
