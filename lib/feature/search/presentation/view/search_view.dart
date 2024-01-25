import 'package:book_store_provider/feature/home/data/home_provider/similler_list_provider.dart';
import 'package:book_store_provider/feature/search/data/search_provider/search_provider.dart';
import 'package:book_store_provider/feature/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = "/search";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchBookProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimillerListProvider(),
        ),
      ],
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
