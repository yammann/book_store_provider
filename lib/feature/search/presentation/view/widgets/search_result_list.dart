import 'package:book_store_provider/feature/home/presentation/views/widgets/book_list_item.dart';
import 'package:book_store_provider/feature/search/data/search_provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBookProvider = Provider.of<SearchBookProvider>(context);

    return ListView.builder(
        itemCount: searchBookProvider.books.length,
        itemBuilder: (context, index) {
          return BookListItem(bookModel: searchBookProvider.books[index]);
        });
  }
}
