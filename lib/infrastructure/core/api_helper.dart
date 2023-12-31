import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:peruri_app/core/commons/constans.dart';
import 'package:peruri_app/infrastructure/common/dtos/api_response_model.dart';
import 'package:peruri_app/infrastructure/core/api_configuration.dart';
import 'package:peruri_app/infrastructure/core/exceptions.dart';

@LazySingleton()
class ApiHelper {
  final Dio _dio;
  ApiHelper(
    this._dio,
  );
  Future<ApiResponseModel> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Map<String, dynamic> _queryParameters = {
        "api-key": Constants.apiKey,
      };

      if (queryParameters != null) {
        _queryParameters.addAll(queryParameters);
      }

      final Response response = await _dio.get(
        path,
        queryParameters: _queryParameters,
        options: options,
      );
      return ApiConfiguration.handleApiResponse(response);
    } on SocketException {
      return Future.error(NoInternetException());
    } on DioException catch (e) {
      return ApiConfiguration.handleDioErrorResponse(e);
    } catch (e) {
      return Future.error(UnknownException(e));
    }
  }
}
