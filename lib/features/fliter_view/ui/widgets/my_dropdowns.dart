// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class MyDropdowns extends StatefulWidget {
//   const MyDropdowns({super.key});
//   @override
//   _MyDropdownsState createState() => _MyDropdownsState();
// }

// class _MyDropdownsState extends State<MyDropdowns> {
//   List<String> selectedItems = ['Deals', 'Price', 'Sort by', 'Gender'];
//   List<List<String>> allItems = [
//     ['On Sale', 'Free Shipping Eligible'],
//     ['Min', 'Max'],
//     [
//       'Recommended',
//       'Newest',
//       'Lowest - Highest Price',
//       'Highest - Lowest Price',
//     ],
//     ['Men', 'Women', 'Kids'],
//   ];
//   List<String> defaultTitles = ['Deals', 'Price', 'Sort by', 'Gender'];
//   int? selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIndex = 4;
//             });
//           },
//           child: FilterChip.elevated(
//             backgroundColor: Colors.deepPurpleAccent,
//             shape: const StadiumBorder(),
//             label: Text('2', style: TextStyle(color: Colors.white)),
//             avatar: const Icon(Icons.filter_list_alt, color: Colors.white),

//             onSelected: (bool value) {
//               setState(() {});
//             },
//           ),

//           //  Container(
//           //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
//           //   decoration: BoxDecoration(
//           //     color:
//           //         selectedIndex == 4
//           //             ? Colors.deepPurple
//           //             : Colors.deepPurpleAccent,
//           //     borderRadius: BorderRadius.circular(20),
//           //   ),
//           //   child: Row(
//           //     mainAxisSize: MainAxisSize.min,
//           //     children: [
//           //       const Icon(
//           //         Icons.filter_list_alt,
//           //         color: Colors.white,
//           //         size: 20,
//           //       ),
//           //       SizedBox(width: 5.w),
//           //       Text('1', style: TextStyle(color: Colors.white)),
//           //     ],
//           //   ),
//           // ),
//         ),

//         SizedBox(width: 8.w),
//         ...List.generate(4, (index) {
//           return Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 _showBottomSheet(context, index);
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               child: Container(
//                 margin: EdgeInsets.all(2),
//                 padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(80.r),
//                   color:
//                       selectedIndex == index ? Colors.deepPurpleAccent : null,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         selectedItems[index],
//                         style: TextStyle(
//                           fontSize: 10.sp,
//                           fontWeight: FontWeight.w400,
//                           color:
//                               selectedIndex == index
//                                   ? Colors.white
//                                   : Colors.black,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Icon(
//                       Icons.keyboard_arrow_down,
//                       color:
//                           selectedIndex == index ? Colors.white : Colors.black,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//       ],
//     );
//   }

//   void _showBottomSheet(BuildContext context, int containerIndex) {
//     showModalBottomSheet(
//       context: context,

//       builder: (BuildContext context) {
//         return Column(
//           // mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedItems[containerIndex] =
//                             defaultTitles[containerIndex];
//                       });
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       'Clear',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),

//                   Text(
//                     defaultTitles[containerIndex],
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.close, size: 28),
//                   ),
//                 ],
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: allItems[containerIndex].length,
//               itemBuilder: (BuildContext context, int index) {
//                 bool isSelected =
//                     selectedItems[containerIndex] ==
//                     allItems[containerIndex][index];
//                 String itemText = allItems[containerIndex][index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10.0,
//                     vertical: 5,
//                   ),
//                   child: Material(
//                     color: isSelected ? Colors.deepPurple : Colors.grey[300],
//                     borderRadius: BorderRadius.circular(18.0),
//                     child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedItems[containerIndex] =
//                               allItems[containerIndex][index];
//                         });
//                         Navigator.pop(context);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 18.0,
//                           vertical: 15.0,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,

//                           children: [
//                             Expanded(
//                               child: Text(
//                                 itemText,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color:
//                                       isSelected ? Colors.white : Colors.black,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),

//                             if (isSelected)
//                               const Icon(Icons.check, color: Colors.white),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:chic_lyne/features/fliter_view/logic/filter_cubit/filter_cubit.dart';
import 'package:chic_lyne/features/fliter_view/ui/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDropdowns extends StatelessWidget {
  const MyDropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterCubit>();
    final filterState = context.watch<FilterCubit>().state;
    final List<List<String>> allItems = [
      ['On Sale', 'Free Shipping Eligible'],
      ['Min', 'Max'],
      [
        'Recommended',
        'Newest',
        'Lowest - Highest Price',
        'Highest - Lowest Price',
      ],
      ['Men', 'Women', 'Kids'],
    ];
    final List<String> defaultTitles = ['Deals', 'Price', 'Sort by', 'Gender'];
    return Row(
      children: [
        BlocBuilder<FilterCubit, FilterState>(
          // استمع لتغييرات حالة FilterCubit
          builder: (context, state) {
            // بناء واجهة المستخدم بناءً على الحالة الحالية
            return FilterChip.elevated(
              // تصميم FilterChip
              backgroundColor: Colors.deepPurpleAccent, // لون الخلفية
              shape: const StadiumBorder(), // شكل الحدود
              label: Text(
                // النص المعروض
                (state.selectedFilterCount ?? 0)
                    .toString(), // عدد الفلاتر المحددة (أو 0 إذا كانت null)
                style: const TextStyle(color: Colors.white), // لون النص
              ),
              avatar: const Icon(
                Icons.filter_list_alt,
                color: Colors.white,
              ), // الأيقونة
              onSelected:
                  (bool value) => filterCubit.updateSelectedIndex(
                    4,
                  ), // عند النقر على FilterChip
            );
          },
        ),
        SizedBox(width: 8.w),
        ...List.generate(4, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (context) => CustomBottomSheet(
                        containerIndex: index,
                        allItems: allItems[index],
                        defaultTitle: defaultTitles[index],
                        selectedItem: filterState.selectedItems[index],
                      ),
                );
                filterCubit.updateSelectedIndex(index);
              },
              child: Container(
                margin: const EdgeInsets.all(2),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(80.r),
                  color:
                      filterState.selectedOptions[index] != null
                          ? Colors.deepPurpleAccent
                          : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        filterState.selectedItems[index],
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color:
                              filterState.selectedOptions[index] != null
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color:
                          filterState.selectedOptions[index] != null
                              ? Colors.white
                              : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
