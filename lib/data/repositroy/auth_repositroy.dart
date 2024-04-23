import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/data/datasource/auth_data_source.dart';
import 'package:appleshop1/di/di.dart';
import 'package:appleshop1/utils/auth_manger.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  /// this method for register user in Repository
  Future<Either<String, String>> register(
      String userName, String password, String confirmPassword);

  /// this method for login user in Repository
  Future<Either<String, String>> login(String userName, String password);
}

class AuthRepository implements IAuthRepository {
  final IAthDataSource _athDataSource = locator.get();

  /// this method for register user in Repository
  @override
  Future<Either<String, String>> register(
      String userName, String password, String confirmPassword) async {
    try {
      await _athDataSource.register(userName, password, confirmPassword);
      return const Right('با موفقیت  ثبت نام شدید');
    } on ApiException catch (e) {
      return Left(e.message ?? 'محتوایی وجود ندارد');
    }
  }

  /// this method for login user in Repository
  @override
  Future<Either<String, String>> login(String userName, String password) async {
    try {
      String token = await _athDataSource.login(userName, password);

      if (token.isNotEmpty) {
        AuthManger.saveAuth(token);
        return right('با موفقیت وارد شدید');
      } else {
        return left('خطایی رخ داد');
      }
    } on ApiException catch (ex) {
      return left(ex.message ?? 'محتوایی وجود ندارد');
    }
  }
}
