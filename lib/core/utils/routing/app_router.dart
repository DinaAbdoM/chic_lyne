

import 'dart:io';

import 'package:chic_lyne/core/di/dependency_injection.dart';
import 'package:chic_lyne/core/utils/routing/routes.dart';
import 'package:chic_lyne/features/auth/login/logic/cubits/login_cubit.dart';
import 'package:chic_lyne/features/auth/login/ui/login.dart';
import 'package:chic_lyne/features/carts/logic/bloc/cart_bloc.dart';
import 'package:chic_lyne/features/carts/ui/cart_view.dart';
import 'package:chic_lyne/features/category/logic/cubit/category_cubit.dart';
import 'package:chic_lyne/features/fliter_view/ui/fliter_views.dart';
import 'package:chic_lyne/features/home/ui/home_view.dart';
import 'package:chic_lyne/features/search_view/logic/cubit/search_products_cubit.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_bloc.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_event.dart';
import 'package:chic_lyne/features/top_selling/ui/top_selling_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashView:
        return _buildRoute(builder: (_) => Container());
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginScreen(),
              ),
        );
      case Routes.registerView:
        return _buildRoute(builder: (_) => Container());
      case Routes.homeView:
        return _buildRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => getIt<CategoryCubit>()..fetchCategories(),

                child: HomeView(),
              ),
        );
      case Routes.search:
        return _buildRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<SearchProductsCubit>()
                          ..searchProducts(args as String),
                child: FilterViews(),
              ),
        );
      case Routes.topSalling:
        return _buildRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (_) =>
                        getIt<TopSellingBloc>()..add(FetchTopSellingProducts()),
                child: TopSellingSection(),
              ),
        );
      default:
        return _buildRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => getIt<CartBloc>(),
                child: CartView(),
              ),
        );
    }
  }

  PageRoute _buildRoute({required WidgetBuilder builder}) {
    return Platform.isAndroid
        ? CupertinoPageRoute(builder: builder)
        : MaterialPageRoute(builder: builder);
  }
}
