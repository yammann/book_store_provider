import 'package:book_store_provider/core/utils/book_provider.dart';
import 'package:book_store_provider/feature/home/data/model/book/book.model.dart';
import 'package:book_store_provider/feature/home/presentation/views/book_detailes_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({
    super.key,
    required this.bookModel,
  });
  final BookModel? bookModel;

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    return GestureDetector(
      onTap: () {
        bookProvider.bookmodel = bookModel!;
        
        Get.toNamed(BookDetailesView.id, arguments: bookProvider.bookmodel);
        
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: bookModel?.volumeInfo!.imageLinks?.thumbnail ??
                    "https://via.placeholder.com/300",
                errorWidget: (context, url, error) =>
                    const Icon(Icons.published_with_changes),
              )),
        ),
      ),
    );
  }
}
