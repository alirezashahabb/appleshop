import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/common/di.dart';
import 'package:dio/dio.dart';

abstract class IAuthDataSorce {
  Future<void> register(
      String userName, String password, String confirmPassword);
  Future<String> login(String userName, String password);
}

class AuthRemoteDataSorce implements IAuthDataSorce {
  final Dio dio = locator.get();

  @override

  ///---------------------------------for Registers
  Future<void> register(
      String userName, String password, String confirmPassword) async {
    try {
      Response response = await dio.post(
        'collections/users/records',
        data: {
          'username': userName,
          'password': password,
          'passwordConfirm': confirmPassword,
        },
      );
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }
  }

  ///---------------------------------for Login
  @override
  Future<String> login(String userName, String password) async {
    try {
      Response response = await dio.post(
        'collections/users/auth-with-password',
        data: {
          'identity': userName,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioException catch (e) {
      throw ApiExptions(e.response?.statusCode, e.response?.data['message']);
    } catch (e) {
      throw ApiExptions(0, 'know Error');
    }

    return '';
  }
}
