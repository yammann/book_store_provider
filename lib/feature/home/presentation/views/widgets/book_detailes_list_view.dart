import 'package:book_store_provider/feature/home/data/home_provider/detailes_list_provider.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/book_list_item.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailesListView extends StatelessWidget {
  const BookDetailesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final detailesListProvider = Provider.of<DetailesListProvider>(context);

    detailesListProvider.fetchNewsetBooks();

    if (detailesListProvider.books.isEmpty) {
      return const LottieLoading();
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: detailesListProvider.books.length,
      itemBuilder: (context, index) => BookListItem(
        bookModel: detailesListProvider.books[index],
      ),
      padding: EdgeInsets.zero,
    );
  }
}
