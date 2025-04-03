// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProductSelectionBottomSheet extends StatefulWidget {
//   final List<String> colors;
//   final List<String> sizes;
//   final Function(String) onColorSelected;
//   final Function(String) onSizeSelected;

//   const ProductSelectionBottomSheet({
//     Key? key,
//     required this.colors,
//     required this.sizes,
//     required this.onColorSelected,
//     required this.onSizeSelected,
//   }) : super(key: key);

//   @override
//   _ProductSelectionBottomSheetState createState() => _ProductSelectionBottomSheetState();
// }

// class _ProductSelectionBottomSheetState extends State<ProductSelectionBottomSheet> {
//   String? _selectedColor;
//   String? _selectedSize;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSelectionSection(
//             title: 'Color',
//             items: widget.colors,
//             selectedItem: _selectedColor,
//             onItemSelected: (color) {
//               setState(() {
//                 _selectedColor = color;
//               });
//               widget.onColorSelected(color);
//             },
//             colorMap: { // خريطة للألوان
//               'Orange': Colors.orange,
//               'Black': Colors.black,
//               'Red': Colors.red,
//               'Yellow': Colors.yellow,
//               'Blue': Colors.blue,
//             },
//           ),
//           SizedBox(height: 20.h),
//           _buildSelectionSection(
//             title: 'Size',
//             items: widget.sizes,
//             selectedItem: _selectedSize,
//             onItemSelected: (size) {
//               setState(() {
//                 _selectedSize = size;
//               });
//               widget.onSizeSelected(size);
//             },
//           ),
//           SizedBox(height: 30.h),
//           _buildCartButton(),
//           SizedBox(height: 10.h),
//           _buildExploreCategoriesButton(),
//         ],
//       ),
//     );
//   }

//   Widget _buildSelectionSection({
//     required String title,
//     required List<String> items,
//     required String? selectedItem,
//     required Function(String) onItemSelected,
//     Map<String, Color>? colorMap, // إضافة خريطة الألوان
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
//             IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//         SizedBox(height: 10.h),
//         Wrap(
//           spacing: 8.w,
//           runSpacing: 8.h,
//           children: items.map((item) => ChoiceChip(
//             label: Text(item),
//             selected: selectedItem == item,
//             selectedColor: Colors.purple.shade200,
//             onSelected: (bool selected) {
//               if (selected) {
//                 onItemSelected(item);
//               }
//             },
//             backgroundColor: Colors.grey.shade200,
//             labelStyle: TextStyle(color: selectedItem == item ? Colors.white : Colors.black),
//             avatar: colorMap != null && colorMap.containsKey(item)
//                 ? CircleAvatar(backgroundColor: colorMap[item], radius: 10.r)
//                 : null,
//           )).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildCartButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.r),
//             side: BorderSide(color: Colors.grey.shade300),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 12.h),
//           child: Text('Your Cart is Empty', style: TextStyle(fontSize: 16.sp)),
//         ),
//       ),
//     );
//   }

//   Widget _buildExploreCategoriesButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.purple,
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 12.h),
//           child: Text('Explore Categories', style: TextStyle(fontSize: 16.sp)),
//         ),
//       ),
//     );
//   }



//  void _showSizeBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: widget.sizes
//               .map(
//                 (size) => ListTile(
//                   title: Text(size),
//                   onTap: () {
//                     setState(() {
//                       _selectedSize = size;
//                     });
//                     widget.onSizeSelected(size);
//                     Navigator.pop(context);
//                   },
//                 ),
//               )
//               .toList(),
//         );
//       },
//     );
//   }

// }