import 'package:appleshop1/bloc/Cart/cart_bloc.dart';
import 'package:appleshop1/common/peyment_handler.dart';
import 'package:appleshop1/common/url_handler.dart';
import 'package:appleshop1/data/datasource/auth_datasoruce.dart';
import 'package:appleshop1/data/datasource/banner_dataSorce.dart';
import 'package:appleshop1/data/datasource/basket_item_dataSource.dart';
import 'package:appleshop1/data/datasource/catogery_dataSorce.dart';
import 'package:appleshop1/data/datasource/comment_datasource.dart';
import 'package:appleshop1/data/datasource/product_detail_dataSorce.dart';
import 'package:appleshop1/data/datasource/products_datasorce.dart';
import 'package:appleshop1/data/repositroy/auth_repositroy.dart';
import 'package:appleshop1/data/repositroy/banner_repositroy.dart';
import 'package:appleshop1/data/repositroy/basket_item_repository.dart';
import 'package:appleshop1/data/repositroy/catrgory_repository.dart';
import 'package:appleshop1/data/repositroy/comment_repositroy.dart';
import 'package:appleshop1/data/repositroy/product_detial_repository.dart';
import 'package:appleshop1/data/repositroy/products_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/category_product_datasorce.dart';
import '../data/repositroy/category_products_repository.dart';

/// this file for getIt handler

var locator = GetIt.instance;

Future<void> getInit() async {
  ///Components

  await _initComponents();

  ///------------------------DataSorce handler
  _initDataSorce();

  ///-----------------------Repositroy handler

  _initRepositroy();

  /// bloc
  locator.registerSingleton<CartBloc>(
    CartBloc(locator.get()),
  );
}

/////////////////////////////////////////////////Repositroy
void _initRepositroy() async {
  locator.registerFactory<IAuthRepositroy>(() => Authrepostiry());
  locator
      .registerFactory<ICategoryRepositroy>(() => CategoryProductsRepository());

  locator.registerFactory<IBannerRepositroy>(() => BannerRepository());
  locator.registerFactory<IProductsRepository>(() => ProdcutsRepository());
  locator.registerFactory<IProductDetailRepositroy>(
      () => ProdcutDetailRepository());
  locator.registerFactory<ICategoryProductsRepositoey>(
      () => CategoryProductRepository());
  locator.registerFactory<IBasketRepository>(() => BasketRepository());
  locator.registerFactory<ICommentRepositroy>(() => CommentRepositroy());
}

/////////////////////////////////////////////////////////////DataSorce
void _initDataSorce() async {
  locator.registerFactory<IAuthDataSorce>(() => AuthRemoteDataSorce());
  locator.registerFactory<IcategoryDataSorce>(() => CategoryRemoteDataSorce());
  locator.registerFactory<IBannerDataSorce>(() => BannerRemoteDataSorce());
  locator.registerFactory<IProductsDataSorce>(() => PrdocutsRemoteDataSorce());
  locator.registerFactory<IProductDetialDataSorce>(
      () => ProducDetailRemoteDataSorce());
  locator.registerFactory<ICategoryProductsDataSorce>(
      () => CategoryProductsRemoteDataSorce());
  locator.registerFactory<IBasketDataSorce>(() => BaskteILocalDataSorce());
  locator.registerFactory<ICommentDataSorce>(() => CommentRemoteDataSorce());
}

Future<void> _initComponents() async {
  locator.registerSingleton<UrlHandler>(UrlLauncher());
  locator
      .registerSingleton<PaymentHandler>(ZarinpalPaymentHandler(locator.get()));

  ///-----------------------components handler
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
    ),
  );
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
