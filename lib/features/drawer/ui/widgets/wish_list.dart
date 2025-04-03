import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/home/ui/widgets/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 35, left: 16, right: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(title: const Text('Wish List')),
              SizedBox(height: 20.h),
              Card(
                color: Colors.grey[300],
                child: ListTile(
                  leading: Icon(Icons.favorite_border_outlined),

                  title: Text(
                    ' My Favorite',
                    style: TextStyles.font15BlackBold,
                  ),
                  subtitle: Text('View all', style: TextStyles.font12greyBold),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    onPressed: () {},
                  ),
                ),
              ),

              Card(
                color: Colors.grey[300],
                child: ListTile(
                  leading: Icon(Icons.favorite_border_outlined),

                  title: Text(
                    ' My Favorite',
                    style: TextStyles.font15BlackBold,
                  ),
                  subtitle: Text('View all', style: TextStyles.font12greyBold),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WishlistItem {
  final String name;
  final String imageUrl;

  WishlistItem({required this.name, required this.imageUrl});
}
