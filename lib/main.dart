import 'package:book_store_provider/core/utils/book_provider.dart';
import 'package:book_store_provider/core/utils/constants.dart';
import 'package:book_store_provider/core/utils/servise_located.dart';
import 'package:book_store_provider/feature/home/presentation/views/book_detailes_view.dart';
import 'package:book_store_provider/feature/home/presentation/views/home_view.dart';
import 'package:book_store_provider/feature/search/presentation/view/search_view.dart';
import 'package:book_store_provider/feature/splash/presentation/views/splach_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  setUpServiseLocated();

  runApp(
    ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SplachView.id,
      getPages: [
        GetPage(name: SplachView.id, page: () => const SplachView()),
        GetPage(name: HomeView.id, page: () => const HomeView()),
        GetPage(name: SearchView.id, page: () => const SearchView()),
        GetPage(name: BookDetailesView.id, page: () => const BookDetailesView())
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
    );
  }
}
