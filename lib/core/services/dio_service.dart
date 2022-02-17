import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:mbo/api/api.dart';
import 'package:mbo/components/models/auth_token.dart';
import 'package:mbo/core/core.dart';

Logger _logger = Logger("Dio Logger");

/// Due to the soft lock bug, I have to change QueueInterceptorsWrapper into InterceptorsWrapper
/// When a request send have 401 error, if token refresh is success and after that the retry request have error again will cause dio request queue
/// into soft lock state, no further request able to execute.

class DioService {
  DioService();

  Dio? _instance;

  Dio getInstance() {
    _instance ??= createDioInstance();
    return _instance!;
  }

  Dio createDioInstance() {
    var dio = Dio(BaseOptions(baseUrl: ApiPath.base.basePath));
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    dio.options.headers['Content-Type'] = 'application/json';

    dio.interceptors.clear();

    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      _logger.info(
          'send request path: ${options.path}, baseURL: ${options.baseUrl}');
      if ((!dio.options.headers.containsKey('Authorization') ||
              dio.options.headers['Authorization'] != '') &&
          app<AuthPreferences>().userToken.isNotEmpty) {
        dio.options.headers['Authorization'] =
            'Bearer ' + app<AuthPreferences>().userToken;
      }
      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }));

    dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handle) async {
      // if result is 401 - Unauthorized, try to get new token if able
      if (error.response?.statusCode == 401 &&
          error.requestOptions.path != ApiPath.auth.token) {
        _logger.warning(
            'Request ${error.requestOptions.path} got response with code ${error.response?.statusCode}, header: ${error.requestOptions.headers['Authorization']}');
        if (dio.options.headers.containsKey('Retry')) {
          dio.options.headers.remove('Retry');
          handle.reject(error);
        }
        dio.options.headers['Retry'] = 1;
        // _logger.info("Got Unauthorized, attempt to refresh token");
        RequestOptions requestOptions = error.requestOptions;
        String newToken = await _getNewToken();
        // if [newToken] is not empty, set it into [Authorization]
        // else remove both [token] and [refreshToken] from this instance and also remove from sharedPref
        if (newToken.isNotEmpty) {
          dio.options.headers['Authorization'] = 'Bearer $newToken';
          app<AuthPreferences>().userToken = newToken;
          final response = await dio.request(requestOptions.path,
              options: Options(method: requestOptions.method),
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters);
          dio.options.headers.remove('Retry');
          handle.resolve(response);
        } else {
          app<AuthPreferences>().userToken = '';
          app<AuthPreferences>().userRefreshToken = '';
          handle.next(error);
        }
      }
      handle.next(error);
    }));
    return dio;
  }

  _getNewToken() async {
    Response response;
    var dio = Dio(BaseOptions(baseUrl: ApiPath.base.basePath, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*'
    }));
    try {
      response = await dio.post(ApiPath.auth.refreshToken,
          data: jsonEncode(
              {'RefreshToken': app<AuthPreferences>().userRefreshToken}));
      if (response.statusCode == 200) {
        return AuthToken.fromJson(response.data).token;
      } else {
        _logger
            .warning("Refresh token return with code ${response.statusCode}");
      }
    } on DioError catch (e) {
      _logger.warning("Refresh token failed! ${e.message}");
    }

    return '';
  }
}
