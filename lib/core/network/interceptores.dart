import 'package:dio/dio.dart';
import 'package:flutter_movie/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie/core/constants/param_keys.dart';
import 'package:flutter_movie/core/constants/route_paths.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/domain/auth/usecases/refresh_token.dart';
import 'package:flutter_movie/service_locator.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
    ),
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} => request ===> $requestPath');
    logger.d('Error type: ${err.error} \n' 'error message: ${err.message}');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ===> $requestPath');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'STATUSCODE: ${response.statusCode} \n '
      'STATUSMESSAGE: ${response.statusMessage} \n '
      'HEADERS: ${response.headers} \n '
      'Data: ${response.data}',
    );
    handler.next(response);
  }
}

class AuthorizationInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
    ),
  );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        final retryRequest = err.requestOptions;
        final newToken = await _getAccessToken();
        retryRequest.headers['Authorization'] = 'Bearer $newToken';

        final cloneReq = await sl<DioClient>().fetch(retryRequest);
        return handler.resolve(cloneReq);
      }
    }
    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _getRefreshToken();
      if (refreshToken != null) {
        final returnedData =
            await sl<RefreshTokenUseCase>().call(params: refreshToken);
        returnedData.fold(
          (error) {
            logger.e("Token refresh returnedData failed: $error");
          },
          (data) async {
            final status = data['success'];
            if (status) return true;
          },
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _forceLogout();
      }
      logger.e("Token refresh failed: $e");
    }
    return false;
  }

  Future<String?> _getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(ParamKeys.refreshTokenKey);
  }

  Future<String?> _getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(ParamKeys.accessTokenKey);
  }

  void _forceLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    AppNavigator.pushedNamedAndRemoveUntil(RoutePaths.signin);
  }
}
