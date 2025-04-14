import 'package:chic_lyne/core/helpers/spacing.dart';
import 'package:chic_lyne/features/category/logic/cubit/category_cubit.dart';
import 'package:chic_lyne/features/category/ui/widgets/category_item_products.dart';
import 'package:chic_lyne/features/fliter_view/ui/fliter_views.dart';
import 'package:chic_lyne/features/home/ui/widgets/app_header.dart';
import 'package:chic_lyne/features/home/ui/widgets/header_section/widgets/search_text_field.dart';
import 'package:chic_lyne/features/search_view/logic/cubit/search_products_cubit.dart';
import 'package:chic_lyne/features/search_view/ui/search_error_view/ui/no_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopByCategories extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  ShopByCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveBackButton(
                onPressed: () => Navigator.pop(context),),
              verticalSpace(20.h),

              SearchTextField(
                hintText: 'Search for products',
                suffixIcon: Icons.close,
                prefixIcon: Icons.search,
                controller: _searchController,
                onSubmitted: (value) async {
                  // جعل الدالة async
                  if (value.isEmpty) {
                    Navigator.pop(context);
                  } else {
                    final isValueInApi = await _isValueInApi(
                      context,
                      value,
                    ); // التحقق من وجود الكلمة
                    if (isValueInApi) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilterViews(),
                        ), // الانتقال إلى FilterViews
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoResultView(),
                        ), // عرض NoResultView
                      );
                    }
                  }
                },
              ),

              //   onChanged: (value) async {
              //     // جعل الدالة async
              //     if (value.isEmpty) {
              //       context.read<CategoryCubit>().fetchCategories();
              //     } else {
              //       final isValueInApi = await _isValueInApi(
              //         context,
              //         value,
              //       ); // التحقق من وجود الكلمة
              //       if (isValueInApi) {
              //         BlocProvider.of<SearchProductsCubit>(
              //           context,
              //         ).searchProducts(value);
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => FilterViews(),
              //           ), // الانتقال إلى FilterViews
              //         );
              //       } else {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => NoResultView(),
              //           ), // عرض NoResultView
              //         );
              //       }
              //     }
              //   },
              // ),
              verticalSpace(20.h),
              Text(
                'Shop By Categories',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              verticalSpace(20.h),
              Expanded(child: _buildCategoriesGrid()),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _isValueInApi(BuildContext context, String value) async {
    // الحصول على قائمة الفئات والمنتجات من الـ API
    final categoriesState = await BlocProvider.of<CategoryCubit>(
      context,
    ).stream.firstWhere(
      (state) => state is CategoriesLoaded || state is CategoryError,
    );
    final productsState = await BlocProvider.of<SearchProductsCubit>(context)
        .stream
        .firstWhere((state) => state is SearchLoaded || state is SearchError);

    // التحقق من وجود القيمة في أسماء الفئات
    bool isCategoryMatch = false;
    if (categoriesState is CategoriesLoaded) {
      isCategoryMatch = categoriesState.categories.any(
        (category) =>
            category.name?.toLowerCase().contains(value.toLowerCase()) ?? false,
      );
    }

    // التحقق من وجود القيمة في أسماء المنتجات أو الأوصاف
    bool isProductMatch = false;
    if (productsState is SearchLoaded) {
      isProductMatch = productsState.products.any(
        (product) =>
            product.title.toLowerCase().contains(value.toLowerCase()) ||
                product.description.toLowerCase().contains(
                  value.toLowerCase(),
                ) ??
            false,
      );
    }

    // إرجاع true إذا تم العثور على القيمة في أي من الأسماء
    return isCategoryMatch || isProductMatch;
  }

  Widget _buildCategoriesGrid() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w, // زيادة المسافة
              mainAxisSpacing: 20.h, // زيادة المسافة
              childAspectRatio: 0.8,
            ),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => CategoryItem(
                            categorySlug: category.slug ?? 'beauty',
                          ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              category.thumbnail ??
                                  'https://via.placeholder.com/150', // صورة افتراضية
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder:
                                  (context, error, stackTrace) => const Icon(
                                    Icons.error,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            category.name ?? 'No Category',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is CategoryError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
