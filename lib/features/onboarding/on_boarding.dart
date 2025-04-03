// // import 'package:chic_lyne/features/home/ui/home_view.dart';
// import 'package:chic_lyne/features/home/ui/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';

// class OnBoardingView extends StatefulWidget {
//   const OnBoardingView({super.key});

//   @override
//   State<OnBoardingView> createState() => _OnBoardingViewState();
// }

// class _OnBoardingViewState extends State<OnBoardingView> {
//   final List<Map<String, dynamic>> staticCategories = [
//     {
//       'name': 'Men\'s',
//       'image': 'assets/man/samuel-lopes-SyPk4FxjTXQ-unsplash.jpg',
//     },
//     {
//       'name': 'Women\'s',
//       'image': 'assets/women/view-3d-woman-wearing-hijab.jpg',
//     },
//     {
//       'name': 'Kids',
//       'image': 'assets/kids/full-shot-smiley-girl-with-flowers.jpg',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               Color.fromRGBO(0, 0, 255, 0.6),
//               Color.fromRGBO(173, 216, 230, 0.1),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FadeInDown(
//                   duration: const Duration(milliseconds: 800),
//                   child: const Text(
//                     'Explore ChickLyne\'s Featured Categories',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     final screenWidth = constraints.maxWidth;
//                     final itemWidth = screenWidth / 3;
//                     final itemHeight = itemWidth * 1.2;
//                     final fontSize = screenWidth * 0.03;

//                     return Wrap(
//                       alignment: WrapAlignment.center,
//                       spacing: 16.0,
//                       runSpacing: 16.0,
//                       children: List.generate(staticCategories.length, (index) {
//                         return FadeInUp(
//                           duration: const Duration(milliseconds: 800),
//                           child: SizedBox(
//                             width: itemWidth,
//                             child: Column(
//                               children: [
//                                 _buildCategoryImage(
//                                   itemWidth: itemWidth,
//                                   itemHeight: itemHeight,
//                                   image: staticCategories[index]['image'],
//                                   category: staticCategories[index]['name'],
//                                   context: context,
//                                 ),
//                                 const SizedBox(height: 8),
//                                 _buildCategoryName(
//                                   name: staticCategories[index]['name'],
//                                   fontSize: fontSize,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryImage({
//     required double itemWidth,
//     required double itemHeight,
//     required String image,
//     required String category,
//     required BuildContext context,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(itemWidth / 6),
//         border: Border.all(color: Colors.grey.shade200, width: 2.0),
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomeView(category: category),
//             ),
//           );
//         },
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(itemWidth / 6),
//           child: Image.asset(
//             image,
//             width: itemWidth,
//             height: itemHeight * 0.8,
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryName({required String name, required double fontSize}) {
//     return Text(
//       name,
//       style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
//       textAlign: TextAlign.center,
//     );
//   }
// }