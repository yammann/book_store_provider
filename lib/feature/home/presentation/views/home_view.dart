import 'package:book_store_provider/feature/home/data/home_provider/detailes_list_provider.dart';
import 'package:book_store_provider/feature/home/data/home_provider/home_list_provider.dart';
import 'package:book_store_provider/feature/home/data/home_provider/similler_list_provider.dart';
import 'package:book_store_provider/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "/HomeView";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailesListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimillerListProvider(),
        ),
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
