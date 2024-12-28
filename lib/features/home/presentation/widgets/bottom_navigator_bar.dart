import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final void Function(int)? onItemTapped;
  final int? selectedIndex;

  const MyBottomNavigationBar({Key? key, this.onItemTapped, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex ?? 0,
      onTap: onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24), label: 'Главная'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 24), label: 'Каталог'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 24), label: 'Корзина'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24), label: 'Профиль')
      ],
    );
  }
}
