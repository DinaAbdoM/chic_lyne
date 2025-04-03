import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/home/ui/widgets/app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatefulWidget {
  final User user;
  final Function(User) onSave;

  const EditProfile({super.key, required this.user, required this.onSave});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  bool _isNameEditable = false;
  bool _isEmailEditable = false;
  bool _isPhoneEditable = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            AppHeader(title: const Text('Edit Profile')),
            SizedBox(height: 20.h),
            _buildEditableTextField(
              controller: _nameController,
              labelText: 'Name',
              isEditable: _isNameEditable,
              onEditPressed:
                  () => setState(() => _isNameEditable = !_isNameEditable),
            ),
            SizedBox(height: 16.h),
            _buildEditableTextField(
              controller: _emailController,
              labelText: 'Email',
              isEditable: _isEmailEditable,
              onEditPressed:
                  () => setState(() => _isEmailEditable = !_isEmailEditable),
            ),
            SizedBox(height: 16.h),
            _buildEditableTextField(
              controller: _phoneController,
              labelText: 'Phone',
              isEditable: _isPhoneEditable,
              onEditPressed:
                  () => setState(() => _isPhoneEditable = !_isPhoneEditable),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final updatedUser = widget.user.copyWith(
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                );
                widget.onSave(updatedUser);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isEditable,
    required VoidCallback onEditPressed,
  }) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          enabled: isEditable,
        ),
        TextButton(
          onPressed: onEditPressed,
          child: Text(
            isEditable ? 'Save' : 'Edit',
            style: TextStyles.font13purpleBold,
          ),
        ),
      ],
    );
  }
}
// IconButton(
//   icon: Icon(isEditable ? Icons.check : Icons.edit),
//   onPressed: onEditPressed,
// ),

class User {
  String name;
  String email;
  String phone;
  String profileImageUrl;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImageUrl,
  });

  User copyWith({
    String? name,
    String? email,
    String? phone,
    String? profileImageUrl,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
// class EditProfilePage extends StatefulWidget {
//   final User user;
//   final Function(User) onSave;

//   const EditProfilePage({super.key, required this.user, required this.onSave});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.user.name);
//     _emailController = TextEditingController(text: widget.user.email);
//     _phoneController = TextEditingController(text: widget.user.phone);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               final updatedUser = User(
//                 name: _nameController.text,
//                 email: _emailController.text,
//                 phone: _phoneController.text,
//                 profileImageUrl: widget.user.profileImageUrl,
//               );
//               widget.onSave(updatedUser);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 16.h),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 16.h),
//             TextField(
//               controller: _phoneController,
//               decoration: InputDecoration(labelText: 'Phone'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class User {
//   String name;
//   String email;
//   String phone;
//   String profileImageUrl;

//   User({
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.profileImageUrl,
//   });

//   User copyWith({String? name, String? email, String? phone, String? profileImageUrl}) {
//     return User(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       phone: phone ?? this.phone,
//       profileImageUrl: profileImageUrl ?? this.profileImageUrl,
//     );
//   }
// }
