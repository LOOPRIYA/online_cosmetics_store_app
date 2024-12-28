import 'package:flutter/material.dart';
import 'package:online_cosmetics_store_app/core/data/models/product_model.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';
import 'package:online_cosmetics_store_app/core/utils/app_utils.dart';
import 'package:online_cosmetics_store_app/core/utils/ui_uitls.dart';
import 'package:online_cosmetics_store_app/features/home/domain/usecases/get_home_data.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/screens/home_screen.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/screens/search_screen.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/widgets/bottom_navigator_bar.dart';
import '../widgets/product_card.dart';

class ProductListingScreen extends StatefulWidget {
  final String title;
  final List<ProductModel>? initialProducts;

  const ProductListingScreen(
      {super.key, required this.title, this.initialProducts});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  int _selectedIndex = 1;
  String _selectedCategory = 'Увлажнение';
  late List<ProductEntity> _products = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text("${_products.length} продкутов"),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/filterOptions");
                                },
                                child: const Icon(Icons.filter_list))
                          ],
                        ),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildFilterButton(
                                  'Очищение',
                                  _selectedCategory == 'Очищение',
                                  () => _selectCategory('Очищение')),
                              const SizedBox(width: 12),
                              _buildFilterButton(
                                  'Увлажнение',
                                  _selectedCategory == 'Увлажнение',
                                  () => _selectCategory('Увлажнение')),
                              const SizedBox(width: 12),
                              _buildFilterButton(
                                  'Регенирация',
                                  _selectedCategory == 'Регенирация',
                                  () => _selectCategory('Регенирация')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.57,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ProductCard(product: _products[index]);
                }, childCount: _products.length),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }

  Widget _buildFilterButton(
      String text, bool isSelected, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : const Color(0xffF4F4F4),
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0.0),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child:
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final currentRoute = ModalRoute.of(context)?.settings.name;

    if (index == 0 && currentRoute != '/') {
      Navigator.push(
          context,
          NoAnimationPageRoute(
              builder: (context) => const HomeScreen(),
              settings: const RouteSettings(name: '/')));
    } else if (index == 1 && currentRoute != '/search') {
      Navigator.push(
        context,
        NoAnimationPageRoute(
            builder: (context) => const SearchScreen(),
            settings: const RouteSettings(name: '/search')),
      );
    }
  }

  Future<void> _loadData() async {
    final data = await GetHomeDataUseCase(
      homeRepository: AppUtils.getHomeRepository(),
    ).call();
    setState(() {
      _products = data.newProducts;
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }
}
