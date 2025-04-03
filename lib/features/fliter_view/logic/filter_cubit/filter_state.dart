// import 'package:chic_lyne/core/theming/styles.dart';
// import 'package:chic_lyne/features/fliter_view/logic/filter_cubit/filter_cubit.dart';
// import 'package:chic_lyne/features/fliter_view/ui/widgets/filter_row_header.dart';
// import 'package:chic_lyne/features/fliter_view/ui/widgets/my_dropdowns.dart';
// import 'package:chic_lyne/features/fliter_view/ui/widgets/result_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FilterViews extends StatelessWidget {
//   const FilterViews({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FilterCubit(),
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(top: 35, left: 8, right: 8, bottom: 8),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const FilterRowHeader(),
//                 const MyDropdowns(),
//                 SizedBox(height: 20.h),
//                 Text(' 53 Result Found', style: TextStyles.font15BlackBold),
//                 const ResultItem(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
