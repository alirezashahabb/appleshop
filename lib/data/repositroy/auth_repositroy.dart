import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:appleshop1/data/datasource/auth_datasoruce.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepositroy {
  Future<Either<String, String>> register(
      String userName, String password, String passwordConfirm);

  Future<Either<String, String>> login(String userName, String password);
}

class Authrepostiry implements IAuthRepositroy {
  final IAuthDataSorce _dataSorce = locator.get();

  @override

  ///---------------------------------for Register
  Future<Either<String, String>> register(
      String userName, String password, String passwordConfirm) async {
    try {
      await _dataSorce.register('alirezashshh', '1234567890', '1234567890');
      return const Right('ثبت نام موفقیت آمیز بود');
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خظا محتوایی نیست');
    }
  }

  ///---------------------------------for Login
  @override
  Future<Either<String, String>> login(String userName, String password) async {
    try {
      String token = await _dataSorce.login(userName, password);
      if (token.isNotEmpty) {
        final SharedPreferences share = locator.get();
        share.setString('acsess_token', token);
        return right('شما با موفقیت وارد شدید');
      } else {
        return const Left('خظایی در ورود رخ داده هست');
      }
    } on ApiExptions catch (e) {
      return Left(e.message ?? 'خظا محتوایی نیست');
    }
  }
}
