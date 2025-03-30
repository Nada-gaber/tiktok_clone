import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return; // Ignore index for Upload button
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      // Custom Bottom Navigation Bar
      bottomNavigationBar: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
            decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(0, 'assets/icons/navbar/home.svg', 'Home'),
                _navItem(1, 'assets/icons/navbar/search.svg', 'Discover'),
                _uploadButton(),
                _navItem(3, 'assets/icons/navbar/inbox.svg', 'Inbox'),
                _navItem(4, 'assets/icons/navbar/profile.svg', 'Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function for normal tab items
  Widget _navItem(int index, String assetPath, String indexTitle) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: SizedBox(
          width: 30,
          height: 30,
          child: Column(
            children: [
              SvgPicture.asset(
                assetPath,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == index ? Colors.white : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Text(
                  indexTitle,
                  style: TextStyle(
                    color: _selectedIndex == index ? Colors.white : Colors.grey,
                    fontSize: 8,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Special Floating Upload Button
  Widget _uploadButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      ),
      child: SvgPicture.asset(
        'assets/icons/navbar/add.svg',
        width: 30,
        height: 30,
      ),
    );
  }
}
