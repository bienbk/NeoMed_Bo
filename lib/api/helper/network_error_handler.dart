import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:mbo/core/core.dart';

final Logger _log = Logger('NetworkErrorHandler');

/// Does nothing with the error except logging it.
///
/// Used when an error can just be ignored.
void silentErrorHandler(dynamic error, [StackTrace? stackTrace]) {
  _log.info('silently ignoring error', error, stackTrace);
}

/// Handles the [error] from a request.
///
/// An error message is shown in a [MboMessage] or [EasyLoader].
void mboApiErrorHandler(dynamic error, [StackTrace? stackTrace]) {
  _log.info('handling mbo error', error);

  String? message;

  if (error is dio.Response) {
    // response error (status code != 2xx)

    switch (error.statusCode) {
      case 401:
        Get.snackbar("Your session has timed out",
            "You will be redirected to login page shortly");
        app<AuthPreferences>().userToken = '';
        app<AuthPreferences>().userRefreshToken = '';
        app<AuthPreferences>().userId = 0;
        Get.offAllNamed('/login');
        return;
      case 429:
        // rate limit reached
        message = 'rate limit reached\n';
        message += 'please try again later';

        break;
      default:
        _log.warning(
          'unhandled response exception\n'
          'headers: ${error.headers}\n'
          'statuscode: ${error.statusCode}\n'
          'data: ${error.data}',
        );
        break;
    }

    message ??= 'an unexpected error occurred (${error.statusCode})\n'
        'please try again later';
  } else if (error is TimeoutException) {
    message = 'request timed out\n'
        'please try again later';
  } else if (error is SocketException) {
    // no internet connection
    message = 'unable to connect to the api servers\n'
        'please try again later';
  } else if (error is Error) {
    _log.warning('api error not handled', error, stackTrace);
  } else if (error is Exception) {
    _log.warning('api exception not handled', error, stackTrace);
  }

  message ??= 'An unexpected error occurred';
  // Get.snackbar('Unable to fetch data', message,
  //     backgroundColor: kBlack, colorText: kWhite);
  // app<MessageService>().show(message);
}
