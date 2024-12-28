import 'package:flutter/material.dart';
import 'package:online_cosmetics_store_app/core/utils/ui_uitls.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/screens/home_screen.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/widgets/bottom_navigator_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> _filterOptions = [
    {'title': 'Назначение', 'route': ''},
    {'title': 'Тип средства', 'route': ''},
    {'title': 'Тип кожи', 'route': '/categoryBySkinType'},
    {'title': 'Линия косметики', 'route': ''},
    {'title': 'Наборы', 'route': ''},
    {'title': 'Акции', 'route': ''},
    {
      'title': 'Консультация с \nкосметологом',
      'route': '/filterOptions/консультация'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 64.0, left: 16.0, right: 16.0),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Поиск',
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey,
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filterOptions.length,
                itemBuilder: (context, index) {
                  final option = _filterOptions[index];
                  final title = option['title'];
                  final route = option['route'];

                  return ListTile(
                    title: Text(title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    onTap: () {
                      Navigator.pushNamed(context, route);
                    },
                  );
                },
              ),
            ),
            Container(
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
                  Text('Составим схему идеального \nдомашнего ухода',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 10),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: []),
                  const Text('10 вопросов о вашей коже',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
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
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: MyBottomNavigationBar(
            onItemTapped: _onItemTapped, selectedIndex: _selectedIndex));
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
              settings: const RouteSettings(name: '/search')));
    }
  }
}
