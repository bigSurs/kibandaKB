import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/models/api_response/api_response.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';

class ApiService {
  ///Retrieves the [RestClient] from the service locator
  static RestClient restClient = GetIt.I<RestClient>();

  ///This method posts data to the API via the [Dio] in the [restClient]
  ///Returns a dynamic
  ///
  ///
  static Future<dynamic> post(
      {required data,
      required String path,
      Options? options,
      Map? queryParameters}) async {
    try {
      ///Get the response after posting
      var response = await restClient.dio!
          .post('${restClient.baseURL}$path', data: data, options: options);
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      ApiResponse apiResponse = ApiResponse.fromJson(e.response!.data);
      throw apiResponse.message!;
    }
  }

  static Future<Map<String, dynamic>> postData({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      var response = await restClient.dio!.post('${restClient.baseURL}$path',
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          }));
      return response.data;
    } on DioError catch (error) {
      try {
        throw error.response!.data['message'][0]['body'];
      } catch (e) {
        throw error.message;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getData(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    try {
      var response = await restClient.dio!.get('${restClient.baseURL}$path',
          options: options, queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }

  ///This method posts data to the API via the [Dio] in the [restClient]
  ///Returns a dynamic
  static Future<dynamic> postCustomer(
      {required data,
      required String path,
      Options? options,
      Map? queryParameters}) async {
    try {
      ///Get the response after posting
      var response = await restClient.dio!
          .post('${restClient.customerURL}$path', data: data, options: options);
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      ApiResponse apiResponse = ApiResponse.fromJson(e.response!.data);
      throw apiResponse.message!;
    }
  }

  ///This method gets data from the API via the [Dio] in the [restClient]
  ///Returns a dynamic based on the API Response
  static Future<dynamic> get(
      {required String path,
      Options? options,
      required Map queryParameters}) async {
    try {
      ///Get the response after posting
      var response = await restClient.dio!
          .get('${restClient.baseURL}$path', options: options);
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      ApiResponse apiResponse = ApiResponse.fromJson(e.response!.data);
      throw apiResponse.message!;
    }
  }
}
