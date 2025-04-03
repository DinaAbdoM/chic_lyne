import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/drawer/ui/widgets/add_address_view.dart';
import 'package:chic_lyne/features/drawer/ui/widgets/edit_profile_view.dart';
import 'package:chic_lyne/features/drawer/ui/widgets/payment_view.dart';
import 'package:chic_lyne/features/drawer/ui/widgets/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatefulWidget {
  final User user;
  final VoidCallback onEditPressed;
  final VoidCallback onSignOutPressed;
  final Function(User) onProfileUpdated;

  const AppDrawer({
    super.key,
    required this.user,
    required this.onEditPressed,
    required this.onSignOutPressed, 
    required this.onProfileUpdated,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  void _updateUser(User updatedUser) {
    setState(() {
      _user = updatedUser;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/man/samuel-lopes-SyPk4FxjTXQ-unsplash.jpg",
                    ),
                    radius: 40.r,
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.all(9.r),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             _user.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                             _user.email,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                             _user.phone,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(
                                  user: _user,
                                  onSave: _updateUser,
                                ),
                              ),
                            );
                          },
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildListTile(
            title: 'Address',
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AddAddressView()),
              );
            },
          ),
          _buildListTile(
            title: 'Wishlist',
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  WishListView()),
              );
            },
          ),
          _buildListTile(
            title: 'Payment',
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentView()),
              );
            },
          ),
          _buildListTile(
            title: 'Help',
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          _buildListTile(
            title: 'Support',
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const SizedBox.shrink(),
          ListTile(
            title: Center(
              child: Text('Sign Out', style: TextStyles.font20RedBold),
            ),
            onTap: widget.onSignOutPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(right: 10.r, left: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ListTile(title: Text(title), trailing: trailing, onTap: onTap),
      ),
    );
  }
}




