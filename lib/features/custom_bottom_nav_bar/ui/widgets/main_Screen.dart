import 'package:chic_lyne/features/custom_bottom_nav_bar/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:chic_lyne/features/drawer/ui/widgets/app_drawer.dart';
import 'package:chic_lyne/features/drawer/ui/widgets/edit_profile_view.dart';
import 'package:chic_lyne/features/home/ui/home_view.dart';
import 'package:chic_lyne/features/notifications/notifications.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  
  const MainScreen({super.key, });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late User _user = User(
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '1234567890',
    profileImageUrl:
        'assets/man/samuel-lopes-SyPk4FxjTXQ-unsplash.jpg', // أو رابط لصورة عبر الإنترنت
  );

  // Callback لتحديث بيانات المستخدم في MainScreen
  void _updateUser(User updatedUser) {
    setState(() {
      _user = updatedUser;
    });
  }

  late List<BottomNavBarItemData> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      BottomNavBarItemData(
        icon: Icons.home_outlined,
        label: '',
        page: HomeView(),
      ),
      BottomNavBarItemData(
        icon: Icons.notifications_outlined,
        label: '',
        page: Notifications(),
      ),
      BottomNavBarItemData(
        icon: Icons.inbox_outlined,
        label: '',
        page: HomeView(),
      ),
      BottomNavBarItemData(
        icon: Icons.person_outline,
        label: '',
        page: Center(
          child: AppDrawer(
            user: _user,
            onSignOutPressed: () {},
            onEditPressed: () {},
            onProfileUpdated: _updateUser,
          ),
        ),
      ),
    ];
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items[_currentIndex].page,
      bottomNavigationBar: CustomBottomNavBar(
        items: _items,
        selectedIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
