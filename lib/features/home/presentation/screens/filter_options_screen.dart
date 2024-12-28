import 'package:flutter/material.dart';

class FilterOptionsScreen extends StatelessWidget {
  const FilterOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Фильтры'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Сортировка", style: name),
                  Text("По популярности", style: type)
                ])),
            const SizedBox(height: 16),
            const ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Тип кожи", style: name),
                  Text("Жирная", style: type)
                ])),
            const ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Тип средства", style: name),
                  Text("Все", style: type)
                ])),
            const ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Проблема кожм", style: name),
                  Text("Не выбрано", style: type)
                ])),
            const ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Эффект средства", style: name),
                  Text("Увлажнение", style: type)
                ])),
            const ListTile(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Линия косметики", style: name),
                  Text("Все", style: type)
                ])),
            const SizedBox(height: 20),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0))),
                child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Применить фильтры',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const name =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);
const type =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey);
