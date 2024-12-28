import 'package:flutter/material.dart';
import 'package:online_cosmetics_store_app/core/theme/app_theme.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/screens/home_screen.dart';

import 'features/home/presentation/screens/category_by_skin_type_screen.dart';
import 'features/home/presentation/screens/filter_options_screen.dart';
import 'features/home/presentation/screens/product_listing_screen.dart';
import 'features/home/presentation/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmetic Shop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/search': (context) => const SearchScreen(),
        '/categoryBySkinType': (context) => const CategoryBySkinType(),
        '/productList': (context) => const ProductListingScreen(title: 'Средства \nдля жирной кожи'),
        '/filterOptions': (context) => const FilterOptionsScreen()
      },
    );
  }
}
