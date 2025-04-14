import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<BottomNavBarItemData> items;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.selectedItemColor,
    this.unselectedItemColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: selectedItemColor ?? Colors.deepPurple,
      unselectedItemColor: unselectedItemColor ?? Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTap,
      items:
          items.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            );
          }).toList(),
    );
  }
}

class BottomNavBarItemData {
  final IconData icon;
  final String? label;
  final Widget page;

  BottomNavBarItemData({required this.icon, this.label, required this.page});
}
// import 'package:chic_lyne/core/network/constants/app_constants_colors.dart';
// import 'package:chic_lyne/features/main_screen/data/bottom_nav_items.dart';
// import 'package:flutter/material.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTap;

//   const CustomBottomNavBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppConstantsColors.primaryColor,
//       unselectedItemColor: Colors.grey,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//       currentIndex: selectedIndex,
//       onTap: onTap,
//       items: BottomNavBarItemData.items.map((item) {
//         return BottomNavigationBarItem(
//           icon: Icon(item.icon),
//           label: item.label,
//         );
//       }).toList(),
//     );
//   }
// }