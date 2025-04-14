import 'package:chic_lyne/features/fliter_view/ui/widgets/filter_row_header.dart';
import 'package:chic_lyne/features/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoResultView extends StatelessWidget {
  const NoResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const FilterRowHeader(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                const _SearchIcon(),
                SizedBox(height: 10.h),
                const _NoResultsText(),
                SizedBox(height: 10.h),
                const _ExploreCategoriesButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchIcon extends StatelessWidget {
  const _SearchIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      size: MediaQuery.of(context).size.width * 0.25, // حجم متناسب
      color: Colors.orangeAccent,
    );
  }
}

class _NoResultsText extends StatelessWidget {
  const _NoResultsText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sorry, We couldn\'t find any\n results for your\n Search.',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}

class _ExploreCategoriesButton extends StatelessWidget {
  const _ExploreCategoriesButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple[300],
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      },
      child: const Text(
        'Explore Categories',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
