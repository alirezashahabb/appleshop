import 'package:appleshop1/data/datasource/auth_datasoruce.dart';
import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
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

  ///-----------------------Repositroy handler

  locator.registerFactory<IAuthRepositroy>(() => Authrepostiry());
}
