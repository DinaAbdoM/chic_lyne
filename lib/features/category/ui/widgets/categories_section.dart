import 'package:chic_lyne/features/category/logic/cubit/category_cubit.dart';
import 'package:chic_lyne/features/category/ui/widgets/category_item_products.dart';
import 'package:chic_lyne/features/category/ui/widgets/shop_by_caregories.dart';
import 'package:chic_lyne/features/home/ui/widgets/text_category_and_top_selling_and_new_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCategoryAndTopSellingAndNewIn(
          text: 'Categories',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          textButton: 'See All',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CategoriesLoaded) {
                          return ShopByCategories();
                        } else if (state is CategoryError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.red,
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
              ),
            );
          },
          styleTextButton: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        SizedBox(height: 5.h),
        buildCategory(),
      ],
    );
  }

  Widget buildCategory() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesLoaded) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth * 0.25;
              final imageHeight = itemWidth * 0.8;
              final fontSize = itemWidth * 0.15;

              return SizedBox(
                height: imageHeight + fontSize + 24.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
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
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        width: itemWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(
                                  0.2,
                                ), // خلفية رمادية شفافة
                              ),
                              child: ClipOval(
                                child:
                                    category.thumbnail != null &&
                                            category.thumbnail!.isNotEmpty
                                        ? Image.network(
                                          category.thumbnail!,
                                          fit: BoxFit.cover,
                                          width: imageHeight,
                                          height: imageHeight,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Icon(
                                                    Icons.error,
                                                    size: imageHeight * 0.5,
                                                    color: Colors.red,
                                                  ),
                                        )
                                        : Image.asset(
                                          'assets/images/default_image.png',
                                          width: imageHeight,
                                          height: imageHeight,
                                        ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              category.name ?? 'No Category',
                              style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        } else if (state is CategoryError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: 18.sp, color: Colors.red),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
