import 'package:appleshop1/data/datasource/auth_datasoruce.dart';
import 'package:appleshop1/data/datasource/banner_dataSorce.dart';
import 'package:appleshop1/data/datasource/catogery_dataSorce.dart';
import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:appleshop1/data/repositroy/banner_repositroy.dart';
import 'package:appleshop1/data/repositroy/catrgory_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// this file for getIt handler

var locator = GetIt.instance;

Future<void> getInit() async {
  ///-----------------------components handler
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  ///------------------------DataSorce handler

  locator.registerFactory<IAuthDataSorce>(() => AuthRemoteDataSorce());
  locator.registerFactory<IcategoryDataSorce>(() => CategoryRemoteDataSorce());
  locator.registerFactory<IBannerDataSorce>(() => BannerRemoteDataSorce());

  ///-----------------------Repositroy handler

  locator.registerFactory<IAuthRepositroy>(() => Authrepostiry());
  locator
      .registerFactory<ICategoryRepositroy>(() => CategoryProductsRepository());

  locator.registerFactory<IBannerRepositroy>(() => BannerRepository());
}
