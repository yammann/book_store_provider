import 'package:book_store_provider/core/utils/book_provider.dart';
import 'package:book_store_provider/feature/home/data/home_provider/similler_list_provider.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/home_listview_item.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimillerBooksListView extends StatelessWidget {
  const SimillerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final simillerListProvider = Provider.of<SimillerListProvider>(context);

    final bookProvider = Provider.of<BookProvider>(context);

    simillerListProvider.fetchSimillerdBooks(
        categore: bookProvider.bookmodel.volumeInfo!.categories?[0]);

    if (simillerListProvider.books.isEmpty) {
      return const LottieLoading();
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: simillerListProvider.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return HomeListViewItem(
                bookModel: simillerListProvider.books[index]);
          },
        ),
      );
    }
  }
}
