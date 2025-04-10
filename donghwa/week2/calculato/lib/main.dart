import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainScreen()));
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              const SizedBox(height: 200),
              _calculatingTools(),
              const Divider(thickness: 2, color: Colors.grey),
              _calculatingButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _calculatingTools() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Icon(Icons.watch_later_outlined),
      Icon(Icons.baby_changing_station),
      Icon(Icons.calculate_outlined),
      SizedBox(),
      Icon(Icons.backspace_outlined),
    ],
  );
}

Widget _item(String text) {
  return Text(text);
}

Widget _calculatingButtons() {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      mainAxisExtent: 70,
      crossAxisSpacing: 10,
    ),
    itemCount: 20,
    itemBuilder: (context, index) {
      return _gridItem(index);
    },
  );
}

Widget _gridItem(int index) {
  var list = [
    "C",
    "()",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "="
  ];

  return GridTile(
    child: CircleAvatar(
      backgroundColor: Colors.grey,
      child: Text(
        list[index],
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}



