import 'package:chefly/features/home/presentation/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:chefly/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeViewBody(),
    Center(child: Text("Favorite Page", style: TextStyle(fontSize: 22))),
    Center(child: Text("Profile Page", style: TextStyle(fontSize: 22))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
