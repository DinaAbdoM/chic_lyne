import 'package:chic_lyne/features/category/ui/widgets/categories_section.dart';
import 'package:chic_lyne/features/home/ui/widgets/header_section/raw_banner_section.dart';
import 'package:chic_lyne/features/home/ui/widgets/header_section/widgets/search_text_field.dart';
import 'package:chic_lyne/features/home/ui/widgets/new_in_section/new_in_section.dart';
import 'package:chic_lyne/features/home/ui/widgets/top_selling_section/top_selling_section.dart';
import 'package:flutter/material.dart';

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
                SearchTextField(onSubmitted: (value) {
                  
                }),
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
