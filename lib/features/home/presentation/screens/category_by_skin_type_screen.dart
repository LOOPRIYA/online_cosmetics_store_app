import 'package:flutter/material.dart';
import 'package:online_cosmetics_store_app/core/utils/ui_uitls.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/screens/home_screen.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/screens/search_screen.dart';
import 'package:online_cosmetics_store_app/features/home/presentation/widgets/bottom_navigator_bar.dart';

class CategoryBySkinType extends StatefulWidget {
  const CategoryBySkinType({super.key});

  @override
  State<CategoryBySkinType> createState() => _CategoryBySkinTypeState();
}

class _CategoryBySkinTypeState extends State<CategoryBySkinType> {
  int _selectedIndex = 1;
  final List<Map<String, dynamic>> _typeOptions = [
    {'title': 'Жирная', 'route': '/productList'},
    {'title': 'Комбинированная', 'route': ''},
    {'title': 'Нормальная', 'route': ''},
    {'title': 'Сухая', 'route': ''},
    {'title': 'Любой типы', 'route': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('По типу кожи',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: _typeOptions.length,
            itemBuilder: (context, index) {
              final option = _typeOptions[index];
              final title = option['title'];
              final route = option['route'];

              return ListTile(
                title: Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                onTap: () {
                  Navigator.pushNamed(context, route);
                },
              );
            },
          )),
      bottomNavigationBar: MyBottomNavigationBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
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
}
