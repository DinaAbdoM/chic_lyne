import 'package:chic_lyne/core/helpers/spacing.dart';
import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/fliter_view/logic/sortby_cubit/sort_by_cubit.dart';
import 'package:chic_lyne/features/fliter_view/logic/sortby_cubit/sort_by_state.dart';
import 'package:chic_lyne/features/fliter_view/ui/widgets/filter_row_header.dart';
import 'package:chic_lyne/features/fliter_view/ui/widgets/my_dropdowns.dart';
import 'package:chic_lyne/features/fliter_view/ui/widgets/result_item.dart';
import 'package:chic_lyne/features/home/ui/widgets/header_section/widgets/search_text_field.dart';
import 'package:chic_lyne/features/search_view/data/models/search_products_models.dart';
import 'package:chic_lyne/features/search_view/logic/cubit/search_products_cubit.dart';
import 'package:chic_lyne/features/search_view/ui/search_error_view/ui/no_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterViews extends StatelessWidget {
  const FilterViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 8, right: 8, bottom: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterRowHeader(),
              const MyDropdowns(),
              SizedBox(height: 20.h),
              // SearchTextField(), 
              BlocBuilder<SearchProductsCubit, SearchProductsState>(
                builder: (context, searchState) {
                  if (searchState is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (searchState is SearchLoaded) {
                    if (searchState.products.isEmpty) {
                      return Expanded(child: NoResultView());
                    } else {
                      return BlocBuilder<SortByCubit, SortByState>(
                        builder: (context, sortState) {
                          List<Product>? products = searchState.products;

                          if (sortState is SortByLoaded) {
                            products = sortState.result.products?.cast<Product>();
                          }

                          final productCount = products?.length ?? 0;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$productCount Result Found',
                                style: TextStyles.font15BlackBold,
                              ),
                              ResultItem(products: products),
                            ],
                          );
                        },
                      );
                    }
                  } else if (searchState is SearchError) {
                    return Center(child: Text('Error: ${searchState.message}'));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop By Categories',
                          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                        // verticalSpace(20.h),
                        // Expanded(child: _buildCategoriesGrid()),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}