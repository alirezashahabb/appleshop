import 'package:appleshop1/common/string_common.dart';
import 'package:appleshop1/data/datasource/auth_data_source.dart';
import 'package:appleshop1/data/datasource/category_datasource.dart';
import 'package:appleshop1/data/datasource/home_data_sorce.dart';
import 'package:appleshop1/data/datasource/product_deatil_data_sorce.dart';
import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:appleshop1/data/repositroy/category_repositroy.dart';
import 'package:appleshop1/data/repositroy/home_repositroy.dart';
import 'package:appleshop1/data/repositroy/product_detail_repositroy.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  /// components
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: StringCommon.baseUrl),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  /// dataSource
  locator.registerFactory<IAthDataSource>(() => AutRemoteDataSource());
  locator
      .registerFactory<ICategoryDataSource>(() => CategoryRemoteDataSource());
  locator.registerFactory<IHomeDataSource>(() => HomeDataSource());
  locator.registerFactory<IProductDataSource>(() => ProductRemoteDataSource());

  ///repository
  locator.registerFactory<IAuthRepository>(() => AuthRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IHomeRepository>(() => HomeRepository());
  locator.registerFactory<IProductDetailRepository>(
      () => ProductDetailRepository());
}
