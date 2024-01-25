import 'package:book_store_provider/feature/search/data/search_provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchTextFiled extends StatelessWidget {
  SearchTextFiled({super.key,});
  

  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchBookProvider = Provider.of<SearchBookProvider>(context);
    return TextField(
      controller: searchTextController,
      onChanged: (value) {
        searchBookProvider.fetchSearchdBooks(bookName: value);
      },
      decoration: const InputDecoration(
          hintText: "Searche",
          suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass)),
    );
  }
}
