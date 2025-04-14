import 'package:chic_lyne/core/di/dependency_injection.dart';
import 'package:chic_lyne/features/category/ui/widgets/categories_section.dart';
import 'package:chic_lyne/features/fliter_view/ui/fliter_views.dart';
import 'package:chic_lyne/features/home/ui/widgets/header_section/raw_banner_section.dart';
import 'package:chic_lyne/features/home/ui/widgets/header_section/widgets/search_text_field.dart';
import 'package:chic_lyne/features/new_in/presentation/ui/new_in_section.dart';
import 'package:chic_lyne/features/top_selling/ui/top_selling_section.dart';
import 'package:chic_lyne/features/search_view/logic/cubit/search_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RawBannerSection(),
                SearchTextField(
                  onSubmitted: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BlocProvider(
                              create:
                                  (context) =>
                                      getIt<SearchProductsCubit>()
                                        ..searchProducts(value),
                              child: FilterViews(),
                            ),
                      ),
                    );
          
                  },
                ),
                CategoriesSection(),
                TopSellingSection(),
                NewInSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
