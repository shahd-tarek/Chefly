import 'package:chefly/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.favorite, 1),
            _buildNavItem(Icons.person, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: isSelected ? kPrimaryColor : Colors.grey),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
