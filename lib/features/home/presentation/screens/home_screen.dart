import 'package:flutter/material.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/category_entity.dart';
import 'package:online_cosmetics_store_app/core/domain/entities/product_entity.dart';
import 'package:online_cosmetics_store_app/core/utils/app_utils.dart';
import 'package:online_cosmetics_store_app/core/utils/ui_uitls.dart';
import 'package:online_cosmetics_store_app/features/home/domain/usecases/get_home_data.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/screens/search_screen.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/widgets/bottom_navigator_bar.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/widgets/carousel_slider.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/widgets/product_card.dart';

import '../../../../core/domain/entities/banner_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late List<BannerEntity> _banners = [];
  late List<CategoryEntity> _categories = [];
  late List<ProductEntity> _newProducts = [];
  late List<ProductEntity> _saleProducts = [];
  late List<ProductEntity> _popularProducts = [];

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
              settings: const RouteSettings(name: '/search')));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await GetHomeDataUseCase(
      homeRepository: AppUtils.getHomeRepository(),
    ).call();
    setState(() {
      _banners = data.banners;
      _categories = data.categories;
      _newProducts = data.newProducts;
      _saleProducts = data.saleProducts;
      _popularProducts = data.popularProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_banners.isNotEmpty)
              CarouselSlider(
                  imageUrls: _banners.map((e) => e.imageUrl).toList(),
                  height: 250),
            const SizedBox(height: 20),
            _buildCategories(),
            const SizedBox(height: 20),
            _buildSection('Новинки', _newProducts, const Color(0xffE4FEF9),
                const Color(0xff66F6DC)),
            const SizedBox(height: 20),
            _buildMyCareScheme(),
            const SizedBox(height: 20),
            _buildSection('Акции', _saleProducts, const Color(0xffF02980),
                const Color(0xffFFC0E1)),
            _buildCategoryButtons(context),
            const SizedBox(height: 20),
            _buildSection('Хиты', _popularProducts, const Color(0xffF86614),
                const Color(0xffFCBC5C)),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }

  Widget _buildCategories() {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalSpacing = screenWidth * 0.04;

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          double leftPadding =
              index == 0 ? horizontalSpacing : horizontalSpacing / 2;
          double rightPadding = index == _categories.length - 1
              ? horizontalSpacing
              : horizontalSpacing / 2;

          return Padding(
            padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(category.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(category.name,
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMyCareScheme() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              opacity: 0.23,
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://s3-alpha-sig.figma.com/img/da9d/20ea/f4039ac4d6ae05d74bee9e6f74632fba?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=atio7Pvolc-cbqNIFN4v5GbgdAW9WZqMtXcm3MDqi-jhG5ROXNabFDbWRcisnS8a9ozr-PAPdc~tPwqJwE9chFuVc0w-179q3bowbWpGaP5xe8snTkFYo3ObKc4y-nZGQY5XDijy8aWYCbRHS~pOeDgAsyYOtNY7TYmAd0qML5Z4n5TEI8hWb9FmVaFHOkTwxSmTIFWkLrIWxiXJe00rtJqLgm1CAjw9kvSXGlcLWsjB0f393wSPxlsEC3V36XSQfL3DGGutEeEloR9PBuCHEsGNdhWGW1tytHoqOHy9CeyrYEcMdrJD0VZY~d3VaDMc5cx0DarX3omUpFtKBP3Nwg__"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Моя схема домашнего ухода',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _buildCareItem(
                'Демакияж', 'https://i.postimg.cc/Pq4mdgPw/Frame-54.png'),
            _buildCareItem(
                'Очищение', 'https://i.postimg.cc/zBGTvxgP/Frame-54-1.png'),
            _buildCareItem(
                'Сыворотка', 'https://i.postimg.cc/DzFrkvyh/Frame-54-2.png'),
            _buildCareItem(
                'Дневной крем', 'https://i.postimg.cc/T3nV4LxQ/Frame-54-3.png')
          ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Ответьте на 10 вопросов, \nи мы подберем нужный уход',
                style: Theme.of(context).textTheme.bodySmall),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2B2B2B),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                child: const Text('Пройти тест',
                    style: TextStyle(color: Colors.white)))
          ])
        ],
      ),
    );
  }

  Widget _buildCareItem(String title, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 23.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
                width: 81,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(image: NetworkImage(url)))),
          ),
          Text(title, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _buildSection(
      String title, List<ProductEntity> products, startColor, endColor) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final cardWidth = screenWidth * 0.4;
        final horizontalSpacing = screenWidth * 0.04;
        final sectionHeight = cardWidth * 1.82;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
              child: Text(title,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: horizontalSpacing, top: 4, bottom: 8),
              child: Container(
                width: 118,
                height: 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [startColor, endColor],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: sectionHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  double leftPadding =
                      index == 0 ? horizontalSpacing : horizontalSpacing / 2;
                  double rightPadding = index == products.length - 1
                      ? horizontalSpacing
                      : horizontalSpacing / 2;

                  return Padding(
                    padding:
                        EdgeInsets.only(left: leftPadding, right: rightPadding),
                    child: SizedBox(
                        width: cardWidth,
                        child: ProductCard(product: products[index])),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildCategoryButtons(BuildContext context) {
  final List<String> categories = [
    "Для очищения",
    "Для увлажнения",
    "Для питания",
    "Для омоложения",
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  side: const BorderSide(color: Color(0xffD9D9D9)),
                ),
                elevation: 0.0,
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            child: Text(categories[index]));
      },
    ),
  );
}
