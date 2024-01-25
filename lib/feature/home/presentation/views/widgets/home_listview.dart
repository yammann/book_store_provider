import 'package:book_store_provider/feature/home/data/home_provider/home_list_provider.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/home_listview_item.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBooksListView extends StatelessWidget {
  const HomeBooksListView({super.key});

  
  @override
  Widget build(BuildContext context) {
    final homeListProvider=Provider.of<HomeListProvider>(context);
    homeListProvider.fetchFeaturedBooks();
        if (homeListProvider.books.isEmpty) {
          return const LottieLoading();
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            itemCount:homeListProvider.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return HomeListViewItem(
                bookModel: homeListProvider.books[index],
              );
            },
          ),
        );
      
  }
}
