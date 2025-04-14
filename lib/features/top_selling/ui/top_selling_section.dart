import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/home/ui/widgets/text_category_and_top_selling_and_new_in.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_bloc.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_state.dart';
import 'package:chic_lyne/features/top_selling/ui/widgets/top_selling_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth * 0.45;
    final itemHeight = screenWidth * 0.7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCategoryAndTopSellingAndNewIn(
          text: 'Top Selling',
          style: TextStyles.font20BlackBold,
          textButton: 'See All',
          styleTextButton: TextStyles.font15BlueBold,
        ),
        const SizedBox(height: 12),
        BlocBuilder<TopSellingBloc, TopSellingState>(
          builder: (context, state) {
            if (state.status == TopSellingStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == TopSellingStatus.failure) {
              return Center(child: Text(state.errorMessage));
            } else if (state.status == TopSellingStatus.success) {
              return TopSellingList(
                products: state.products,
                itemHeight: itemHeight,
                itemWidth: itemWidth,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}












// import 'package:chic_lyne/core/theming/styles.dart';
// import 'package:chic_lyne/features/home/ui/widgets/text_category_and_top_selling_and_new_in.dart';
// import 'package:flutter/material.dart';

// class TopSellingSection extends StatelessWidget {
//   const TopSellingSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextCategoryAndTopSellingAndNewIn(
//           text: 'Top Selling',
//           style: TextStyles.font20BlackBold,

//           textButton: 'See All',
//           styleTextButton: TextStyles.font15BlueBold,
//         ),
//         _buildTopSellingItems(),
//       ],
//     );
//   }

//   Widget _buildTopSellingItems() {
    
//     List<Map<String, dynamic>> topSellingItems = [
//       {
//         'name': 'Men\'s Harrington Jacket',
//         'price': '\$148.00',
//         'image': 'assets/man/men-shoes.jpg',
//       },
//       {
//         'name': 'Men\'s Coaches Jacket',
//         'price': '\$66.97',
//         'image': 'assets/man/men-shoes.jpg',
//       },
//       {'name': 'Max', 'price': '\$55.00', 'image': 'assets/man/men-shoes.jpg'},
//       {
//         'name': 'Men\'s Harrington Jacket',
//         'price': '\$148.00',
//         'image': 'assets/man/men-shoes.jpg',
//       },
//       {
//         'name': 'Men\'s Harrington Jacket',
//         'price': '\$148.00',
//         'image': 'assets/man/men-shoes.jpg',
//       },
//       {
//         'name': 'Men\'s Harrington Jacket',
//         'price': '\$148.00',
//         'image': 'assets/man/men-shoes.jpg',
//       },
//     ];

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final screenWidth = MediaQuery.of(context).size.width;
//         final itemWidth = constraints.maxWidth / 2;
//         final itemHeight = screenWidth * 0.6;
//         final fontSize = screenWidth * 0.03;

//         return SizedBox(
//           height: itemHeight,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: topSellingItems.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   width: itemWidth,
//                   color: Colors.grey[200],
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         topSellingItems[index]['image'],
//                         fit: BoxFit.fill,
//                         height: itemHeight * 0.6,
//                       ),
//                       Spacer(flex: 2),
//                       Text(
//                         topSellingItems[index]['name'],
//                         style: TextStyle(
//                           fontSize: fontSize,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         topSellingItems[index]['price'],
//                         style: TextStyle(
//                           fontSize: fontSize,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
