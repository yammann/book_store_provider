import 'package:book_store_provider/core/utils/book_provider.dart';
import 'package:book_store_provider/core/utils/style.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/book_detailes.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/book_detailes_appbar.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/similler_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailesBody extends StatelessWidget {
   const BookDetailesBody({super.key,});
 
  @override
  Widget build(BuildContext context) {
     final bookProvider = Provider.of<BookProvider>(context);
    
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 24,
              right: 24,
            ),
            child: Column(
              children: [
                const BookDetailesAppbar(),
                BookDetailes(bookModel: bookProvider.bookmodel),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You Can Also Like",
                    style: Styles.textStyle20,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 150, child: SimillerBooksListView()),
        )
      ],
    );
  }
}
