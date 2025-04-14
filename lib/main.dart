import 'package:chic_lyne/core/di/dependency_injection.dart';
import 'package:chic_lyne/features/carts/logic/bloc/cart_bloc.dart';
import 'package:chic_lyne/features/category/logic/cubit/category_cubit.dart';
import 'package:chic_lyne/features/custom_bottom_nav_bar/ui/widgets/main_Screen.dart';
import 'package:chic_lyne/features/custom_bottom_nav_bar/ui/widgets/ui/main_screen.dart';
import 'package:chic_lyne/features/fliter_view/logic/filter_cubit/filter_cubit.dart';
import 'package:chic_lyne/features/fliter_view/logic/sortby_cubit/sort_by_cubit.dart';
import 'package:chic_lyne/features/home/ui/home_view.dart';
import 'package:chic_lyne/features/new_in/presentation/cubit/products_cubit.dart';
import 'package:chic_lyne/features/search_view/logic/cubit/search_products_cubit.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_bloc.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MultiBlocProvider(
            // providers: [
            //   BlocProvider(
            //     create:
            //         (context) =>
            //             SortByCubit(sortByRepo: sortByRepo)
            //               ..getSortBy('price', 'asc'),
            //   ),
            //   BlocProvider(create: (context) => FilterCubit()),
            //   BlocProvider(
            //     create:
            //         (context) =>
            //             CategoryCubit(CategoryRepository(ApiServiceScip(Dio())))
            //               ..fetchCategories(),
            //   ),
            //   BlocProvider(create: (context) => getIt<SearchProductsCubit>()),
            //   BlocProvider(
            //     create: (context) => getIt<CartCubit>(),
            //   ),
            // ],
            providers: [
              BlocProvider(
                create: (_) => getIt<SortByCubit>()..getSortBy('price', 'asc'),
              ),
              BlocProvider(create: (_) => getIt<FilterCubit>()),
              BlocProvider(
                create: (_) => getIt<CategoryCubit>()..fetchCategories(),
              ),
              BlocProvider(create: (_) => getIt<SearchProductsCubit>()),
              // BlocProvider(create: (_) => getIt<CartCubit>()..loadCart()),
              // BlocProvider(
              //   create: (context) {
              //     final cubit = getIt<CartCubit>();
              //     cubit.loadCart().then((_) {
              //       if (cubit.state.cart?.products.isNotEmpty ?? false) {
              //         final firstProduct = cubit.state.cart!.products.first;
              //         cubit.decrementProductQuantity(firstProduct);
              //         cubit.incrementProductQuantity(firstProduct);
              //       }
              //     });
              //     return cubit;
              //   },
              // ),
              BlocProvider(
                create: (_) => getIt<CartBloc>()..add(GetAllCartsEvent()),
              ),
              BlocProvider(
                create:
                    (_) =>
                        getIt<TopSellingBloc>()
                          ..add(FetchTopSellingProducts(limit: 5)),
              ),
              BlocProvider(
                create:
                    (context) => getIt<NweInProductsCubit>()..loadNewProducts(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              home: const MainScreen(),
            ),
          ),
    );
  }
}
