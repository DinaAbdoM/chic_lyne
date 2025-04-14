// // // import 'package:chic_lyne/core/theming/styles.dart';
// // // import 'package:chic_lyne/features/home/ui/widgets/text_category_and_top_selling_and_new_in.dart';
// // // import 'package:flutter/material.dart';

// // // class NewInSection extends StatelessWidget {
// // //   const NewInSection({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         TextCategoryAndTopSellingAndNewIn(
// // //           text: 'New In',
// // //           style: TextStyles.font20purpleBold,

// // //           textButton: 'See All',
// // //           styleTextButton: TextStyles.font15BlueBold,
// // //         ),
// // //         _buildNewInItems(),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildNewInItems() {
// // //     List<Map<String, dynamic>> newInItems = [
// // //       {
// // //         'name': 'Men\'s Harrington Jacket',
// // //         'price': '\$148.00',
// // //         'image': 'assets/man/men-shoes.jpg',
// // //       },
// // //       {
// // //         'name': 'Men\'s Coaches Jacket',
// // //         'price': '\$66.97',
// // //         'image': 'assets/man/men-shoes.jpg',
// // //       },
// // //       {'name': 'Max', 'price': '\$55.00', 'image': 'assets/man/men-shoes.jpg'},
// // //     ];
// // //     return LayoutBuilder(
// // //       builder: (context, constraints) {
// // //         final screenWidth = MediaQuery.of(context).size.width;
// // //         final itemWidth = constraints.maxWidth / 2;
// // //         final itemHeight = screenWidth * 0.6;
// // //         final fontSize = screenWidth * 0.03;
// // //         return SizedBox(
// // //           height: itemHeight,
// // //           child: ListView.builder(
// // //             scrollDirection: Axis.horizontal,
// // //             itemCount: newInItems.length,
// // //             itemBuilder: (context, index) {
// // //               return Padding(
// // //                 padding: const EdgeInsets.all(8.0),
// // //                 child: Container(
// // //                   padding: EdgeInsets.all(8),
// // //                   width: itemWidth,
// // //                   color: Colors.grey[200],
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Image.asset(
// // //                         newInItems[index]['image'],
// // //                         fit: BoxFit.fill,
// // //                         height: itemHeight * 0.6,
// // //                       ),
// // //                       Spacer(flex: 2),
// // //                       Text(
// // //                         newInItems[index]['name'],
// // //                         style: TextStyle(
// // //                           fontSize: fontSize,
// // //                           fontWeight: FontWeight.bold,
// // //                         ),
// // //                       ),
// // //                       Text(
// // //                         newInItems[index]['price'],
// // //                         style: TextStyle(
// // //                           fontSize: fontSize,
// // //                           fontWeight: FontWeight.bold,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }
// // import 'package:chic_lyne/features/new_in/presentation/cubit/products_cubit.dart';
// // import 'package:chic_lyne/features/new_in/presentation/ui/widgets/product_card.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class NewInSection extends StatelessWidget {
// //   const NewInSection({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('New Products'),
// //       ),
// //       body: BlocBuilder<NweInProductsCubit, ProductsState>(
// //         builder: (context, state) {
// //           if (state is ProductsLoading) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (state is ProductsError) {
// //             return Center(child: Text(state.message));
// //           } else if (state is ProductsLoaded) {
// //             return ListView.builder(
// //               itemCount: state.products.length,
// //               itemBuilder: (context, index) {
// //                 return ProductCard(product: state.products[index]);
// //               },
// //             );
// //           }
// //           return const Center(child: Text('Press button to load products'));
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => context.read<NweInProductsCubit>().loadNewProducts(),
// //         child: const Icon(Icons.refresh),
// //       ),
// //     );
// //   }
// // }import 'package:chic_lyne/core/theming/styles.dart';
// import 'package:chic_lyne/core/theming/styles.dart';
// import 'package:chic_lyne/features/home/ui/widgets/text_category_and_top_selling_and_new_in.dart';
// import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';
// import 'package:chic_lyne/features/new_in/presentation/cubit/products_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NewInSection extends StatelessWidget {
//   const NewInSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NweInProductsCubit, ProductsState>(
//       builder: (context, state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextCategoryAndTopSellingAndNewIn(
//               text: 'New In',
//               style: TextStyles.font20purpleBold,
//               textButton: 'See All',
//               styleTextButton: TextStyles.font15BlueBold,
//               onPressed: () => context.read<NweInProductsCubit>().loadNewProducts(),
//             ),
//             _buildNewInItems(context, state),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildNewInItems(BuildContext context, ProductsState state) {
//     if (state is ProductsLoading) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (state is ProductsError) {
//       return Center(child: Text(state.message));
//     } else if (state is ProductsLoaded) {
//       return _buildProductsList(context, state.products);
//     }
//     return _buildProductsList(context, []); // Empty list for initial state
//   }

//   Widget _buildProductsList(BuildContext context, List<ProductEntity> products) {
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
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   width: itemWidth,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.network(
//                           product.thumbnail,
//                           fit: BoxFit.cover,
//                           height: itemHeight * 0.6,
//                           width: double.infinity,
//                           errorBuilder: (context, error, stackTrace) =>
//                               const Icon(Icons.error_outline, size: 50),
//                         ),
//                       ),
//                       const Spacer(flex: 2),
//                       Text(
//                         product.title,
//                         style: TextStyle(
//                           fontSize: fontSize,
//                           fontWeight: FontWeight.bold,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         maxLines: 1,
//                       ),
//                       Text(
//                         '\$${product.price.toStringAsFixed(2)}',
//                         style: TextStyle(
//                           fontSize: fontSize,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepPurple,
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

import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/home/ui/widgets/text_category_and_top_selling_and_new_in.dart';
import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';
import 'package:chic_lyne/features/new_in/presentation/cubit/products_cubit.dart';
import 'package:chic_lyne/features/new_in/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewInSection extends StatelessWidget {
  const NewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NweInProductsCubit, ProductsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCategoryAndTopSellingAndNewIn(
              text: 'New In',
              style: TextStyles.font20purpleBold,
              textButton: 'See All',
              styleTextButton: TextStyles.font15BlueBold,
              onPressed:
                  () => context.read<NweInProductsCubit>().loadNewProducts(),
            ),
            _buildNewInItems(context, state),
          ],
        );
      },
    );
  }

  Widget _buildNewInItems(BuildContext context, ProductsState state) {
    if (state is ProductsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ProductsError) {
      return Center(child: Text(state.message));
    } else if (state is ProductsLoaded) {
      return _buildProductsList(context, state.products);
    }
    return _buildProductsList(context, []); // Empty list for initial state
  }

  Widget _buildProductsList(
    BuildContext context,
    List<ProductEntity> products,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final itemWidth = constraints.maxWidth / 2;
        final itemHeight = screenWidth * 0.6;
        final fontSize = screenWidth * 0.03;

        return SizedBox(
          height: itemHeight,
          child: ListView.builder(
            addRepaintBoundaries: true, // دي بتساعد في عدم إعادة رسم كل العناصر
            cacheExtent:
                300, // دي بتخلي التطبيق يحفظ شوية عناصر قبل وبعد اللي شايفها
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                itemHeight: itemHeight,
                itemWidth: itemWidth,
                fontSize: fontSize,
              );
            },
          ),
        );
      },
    );
  }
}
