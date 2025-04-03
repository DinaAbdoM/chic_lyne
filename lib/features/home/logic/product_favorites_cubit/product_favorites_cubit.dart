// // Cubit لإدارة المنتجات المفضلة

// import 'package:chic_lyne/features/home/data/repos/category_repository.dart';
// import 'package:chic_lyne/features/home/logic/product_favorites_cubit/product_favorites_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductFavoritesCubit extends Cubit<ProductFavoritesState> {
//   final CategoryRepository categoryRepository;
//   List<Product> favoriteProducts = [];

//   ProductFavoritesCubit(this.categoryRepository)
//     : super(ProductFavoritesInitial());

//   Future<void> fetchProductsByCategory(String slug) async {
//     emit(ProductFavoritesLoading());
//     try {
//       final products = await categoryRepository.getProductsByCategory(slug);
//       emit(ProductFavoritesLoaded(products));
//     } catch (e) {
//       emit(ProductFavoritesError(e.toString()));
//     }
//   }

//   bool isFavorite(Product product) {
//     return favoriteProducts.contains(product);
//   }

//   void toggleFavorite(Product product) {
//     if (isFavorite(product)) {
//       favoriteProducts.remove(product);
//     } else {
//       favoriteProducts.add(product);
//     }
//     if (state is ProductFavoritesLoaded) {
//       emit(
//         ProductFavoritesLoaded((state as ProductFavoritesLoaded).productScip),
//       );
//     }
//   }

//   void navigateToFavoritesPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FavoritesPage(favoriteProducts: favoriteProducts),
//       ),
//     );
//   }
// }
