import 'package:flutter/material.dart';
import 'package:repolens/Widgets/gallery.dart';
import 'package:repolens/Widgets/repo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;
  Color mycolor = const Color(0xFF8BAAAD);
  @override
  Widget build(BuildContext context) {
    Widget? content;
    if (selectedIndex == 0) {
      content = const Repo();
    }
    if (selectedIndex == 1) {
      content =  Gallery();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('RepoLens'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_outline),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: mycolor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: content,
    );
  }
}
