import 'package:book_store_provider/feature/home/data/home_provider/similler_list_provider.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/book_detailes_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailesView extends StatelessWidget {
  const BookDetailesView({
    super.key,
  });

  static String id = "/details";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SimillerListProvider(),
        ),
      ],
      child: const Scaffold(
        body: BookDetailesBody(),
      ),
    );
  }
}
