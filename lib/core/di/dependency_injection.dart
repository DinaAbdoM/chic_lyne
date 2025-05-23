import 'package:chic_lyne/core/network/dio_client.dart';
import 'package:chic_lyne/core/network/network_info.dart';
import 'package:chic_lyne/features/auth/login/data/repositories/auth_repo.dart';
import 'package:chic_lyne/features/auth/login/logic/cubits/login_cubit.dart';
import 'package:chic_lyne/features/carts/data/datasources/cart_remote_datasource.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/usecases/add_cart_use_case.dart';
import 'package:chic_lyne/features/carts/domain/usecases/get_all_carts.dart';
import 'package:chic_lyne/features/carts/domain/usecases/get_cart_by_id_use_case.dart'
    show GetCartById;
import 'package:chic_lyne/features/carts/domain/usecases/get_cart_by_user_use_case.dart';
import 'package:chic_lyne/features/carts/logic/bloc/cart_bloc.dart';
import 'package:chic_lyne/features/carts/logic/cubit/cart_cubit.dart';
import 'package:chic_lyne/features/category/logic/cubit/category_cubit.dart';
import 'package:chic_lyne/features/fliter_view/data/apis/sort_by_api_service.dart';
import 'package:chic_lyne/features/fliter_view/data/repos/sort_by.dart';
import 'package:chic_lyne/features/fliter_view/logic/filter_cubit/filter_cubit.dart';
import 'package:chic_lyne/features/fliter_view/logic/sortby_cubit/sort_by_cubit.dart';
import 'package:chic_lyne/features/home/data/apis/api_service.dart';
import 'package:chic_lyne/features/home/data/repos/category_repository.dart';
import 'package:chic_lyne/features/new_in/data/repositories/product_repository_impl.dart';
import 'package:chic_lyne/features/new_in/data/services/api_service.dart';
import 'package:chic_lyne/features/new_in/data/services/product_service.dart';
import 'package:chic_lyne/features/new_in/domain/usecases/get_new_products_usecase.dart';
import 'package:chic_lyne/features/new_in/domain/repositories/product_repository.dart';
import 'package:chic_lyne/features/new_in/presentation/cubit/products_cubit.dart';
import 'package:chic_lyne/features/search_view/data/api/search_api_service.dart';
import 'package:chic_lyne/features/search_view/data/repo/product_repository.dart';
import 'package:chic_lyne/features/search_view/logic/cubit/search_products_cubit.dart';
import 'package:chic_lyne/features/top_selling/data/datasources/models/top_selling_remote_data_source.dart';
import 'package:chic_lyne/features/top_selling/data/repositories/top_selling_repository_impl.dart';
import 'package:chic_lyne/features/top_selling/domain/repositories/top_selling_repository.dart';
import 'package:chic_lyne/features/top_selling/domain/usecases/get_top_selling_products.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/carts/domain/usecases/add_product_to_cart_use_case.dart';
import '../../features/carts/domain/usecases/clear_cart_use_case.dart';
import '../../features/carts/domain/usecases/decrement_product_quantity_use_case.dart';
import '../../features/carts/domain/usecases/delete_cart_use_case.dart';
import '../../features/carts/domain/usecases/increment_product_quantity_use_case.dart';
import '../../features/carts/domain/usecases/remove_product_from_cart_use_case.dart';
import '../../features/carts/domain/usecases/update_cart_use_case.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // 1. Initialize Dio with proper configuration
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  // getIt.registerLazySingleton<Dio>(() => CartUtils.createDio());
  // 2. Filter Feature Dependencies
  getIt.registerLazySingleton<SortByApiService>(
    () => SortByApiService(getIt()),
  );
  getIt.registerLazySingleton<SortByRepo>(() => SortByRepo(getIt()));
  getIt.registerFactory<SortByCubit>(() => SortByCubit(getIt()));
  getIt.registerFactory<FilterCubit>(() => FilterCubit());
  // Category Feature Dependencies

  getIt.registerLazySingleton<ApiServiceScip>(() => ApiServiceScip(getIt()));
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepository(getIt()),
  );
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));
  // 3. Search Feature Dependencies
  getIt.registerLazySingleton<SearchApiService>(
    () => SearchApiService(getIt()),
  );
  getIt.registerLazySingleton<SearchRepository>(
    () => SearchRepository(getIt()),
  );
  getIt.registerFactory<SearchProductsCubit>(
    () => SearchProductsCubit(getIt()),
  );

  // Cart Dependencies
  // getIt.registerLazySingleton<CartApiService>(
  //   () => CartApiService(getIt<Dio>()),
  // );

  // getIt.registerLazySingleton<CartRepository>(
  //   () => CartRepository(getIt<CartApiService>()),
  // );

  // getIt.registerFactory<CartCubit>(
  //   () => CartCubit(
  //     repository: getIt<CartRepository>(),
  //     cartUtils: getIt<CartUtils>(),
  //   ),
  // );
  // Network
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Data Sources
  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(getIt()),
  );
  // Repository
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(getIt()),
  );
  //  Blocs
  getIt.registerFactory(
    () => CartBloc(
      getAllCarts: getIt(),
      getCartById: getIt(),
      getCartByUser: getIt(),
      addCart: getIt(),
      updateCart: getIt(),
      deleteCart: getIt(),
      addProductToCart: getIt(),
      removeProductFromCart: getIt(),
      incrementProductQuantity: getIt(),
      decrementProductQuantity: getIt(),
      clearCart: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetAllCarts(getIt()));
  getIt.registerLazySingleton(() => GetCartById(getIt()));
  getIt.registerLazySingleton(() => GetCartByUser(getIt()));
  getIt.registerLazySingleton(() => AddCart(getIt()));
  getIt.registerLazySingleton(() => UpdateCart(getIt()));
  getIt.registerLazySingleton(() => DeleteCart(getIt()));
  getIt.registerLazySingleton(() => AddProductToCart(getIt()));
  getIt.registerLazySingleton(() => RemoveProductFromCart(getIt()));
  getIt.registerLazySingleton(() => IncrementProductQuantity(getIt()));
  getIt.registerLazySingleton(() => DecrementProductQuantity(getIt()));
  getIt.registerLazySingleton(() => ClearCart(getIt()));
  try {
    await getIt.allReady();
  } catch (e) {
    throw Exception('Dependency injection failed: $e');
  }
  //! External
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton(() {
      final dio = Dio();
      dio.options.baseUrl = 'https://dummyjson.com';
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 30);
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      return dio;
    });
  }
  // Top Selling
  getIt.registerSingleton<TopSellingRemoteDataSource>(
    TopSellingRemoteDataSourceImpl(dioClient: getIt()),
  );
  getIt.registerSingleton<TopSellingRepository>(
    TopSellingRepositoryImpl(remoteDataSource: getIt()),
  );
  // getIt.registerSingleton<GetTopSellingProducts>(
  //   GetTopSellingProducts(repository: getIt()),
  // );

  getIt.registerFactory(() => GetTopSellingProducts(repository: getIt()));

  getIt.registerFactory(() => TopSellingBloc(getTopSellingProducts: getIt()));
  // New In
  // Cubits / Blocs
  getIt.registerFactory(() => NweInProductsCubit(getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetNewProductsUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );

  // Services
  getIt.registerLazySingleton(() => ProductService());

  getIt.registerLazySingleton(() => ApiService());


  getIt.registerLazySingleton(() => CartCubit());
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
