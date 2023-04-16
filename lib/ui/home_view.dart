import 'package:flutter/material.dart';
import 'package:space_x/const/app_strings.dart';
import 'package:space_x/ui/company/company_view.dart';
import 'package:space_x/ui/launch/launch_list_view.dart';
import 'package:space_x/ui/rocket/rocket_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const LaunchListView(),
    const CompanyView(),
    const RocketListView(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  void _onItemTap(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _buildUI() {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blue,
        currentIndex: _currentPageIndex,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
            label: AppStrings.launches,
            icon: Icon(Icons.rocket_launch),
          ),
          BottomNavigationBarItem(
            label: AppStrings.company,
            icon: Icon(Icons.info_outline),
          ),
          BottomNavigationBarItem(
            label: AppStrings.rockets,
            icon: Icon(Icons.rocket),
          ),
        ],
      ),
    );
  }
}
