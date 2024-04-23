import 'package:appleshop1/common/Api_exptions.dart';
import 'package:appleshop1/di/di.dart';
import 'package:dio/dio.dart';

abstract class IAthDataSource {
  /// this method for register user in DataSource
  Future<void> register(
      String userName, String password, String confirmPassword);

  /// this method for login user in DataSource
  Future<String> login(String userName, String password);
}

class AutRemoteDataSource implements IAthDataSource {
  final Dio _dio = locator.get();

  @override

  /// this method for register user in DataSource
  Future<void> register(
      String userName, String password, String confirmPassword) async {
    try {
      await _dio.post(
        'collections/users/records',
        data: {
          'username': userName,
          'password': password,
          'passwordConfirm': confirmPassword,
        },
      );
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'know error');
    }
  }

  @override

  /// this method for login user in DataSource
  Future<String> login(String userName, String password) async {
    try {
      Response response = await _dio.post(
        'collections/users/auth-with-password',
        data: {
          'identity': userName,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (e) {
      throw ApiException(0, 'know error');
    }
    return '';
  }
}
