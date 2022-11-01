import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';
import 'package:kibanda_kb/models/api_response/api_response.dart';
import 'package:kibanda_kb/models/customer_token_model.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utilities/rest_client/rest_client_customer.dart';

class ApiService {
  ///Retrieves the [RestClient] from the service locator
  static RestClient restClient = GetIt.I<RestClient>();

  static RestClientCustomer restClientCustomer = GetIt.I<RestClientCustomer>();

  ///This method posts data to the API via the [Dio] in the [restClient]
  ///Returns a dynamic
  ///
  ///
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

  static Future<dynamic> getDataNoAuth(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    try {
      var response = await restClient.dioNoAuth!.get(
          '${restClient.customerURL}$path',
          options: options,
          queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Map<String, dynamic>> postDataMpesa({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      var response =
          await restClientCustomer.dio!.post('${restClient.customerURL}$path',
              data: data,
              options: Options(headers: {
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
                'X-User': 'customer',
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

  static Future<Map<String, dynamic>> postData({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      var response =
          await restClient.dio!.post('${restClient.customerURL}$path',
              data: data,
              options: Options(headers: {
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
                'X-user': 'customer',
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

  static Future<Map<String, dynamic>> postDataOrder({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      Dio dio = Dio();
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
      var x = GetIt.I<CustomerTokenCubit>().state;
      var response = await dio.post('${restClient.customerURL}$path',
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'x-user': 'customer',
            'authorization': 'Bearer $x'
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

  ///This method posts data to the API via the [Dio] in the [restClient]
  ///Returns a dynamic
  static Future<dynamic> postCustomer(
      {required data,
      required String path,
      Options? options,
      Map? queryParameters}) async {
    try {
      ///Get the response after posting
      var response =
          await restClient.dio!.post('${restClient.customerURL}$path',
              data: data,
              options: Options(headers: {
                'X-user': 'customer',
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
              }));
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

  static Future<dynamic> getData(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    try {
      var response = await restClient.dio!.get('${restClient.customerURL}$path',
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'X-user': 'customer',
            'Connection': 'keep-alive',
            'Accept-encoding': 'gzip, deflate, br',
            'Accept': '*/*',
            'User-Agent': 'PostmanRuntime/7.29.2',
          }),
          queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getPaymentData(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    try {
      var response = await restClient.dio!.get('${restClient.customerURL}$path',
          options: options, queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getDataPayments(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    try {
      var response = await restClient.dio!.get('${restClient.customerURL}$path',
          options: options, queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Use this to authenticate an API only to the user
  /// This should work as expected with all our previous implementation
  static Future<dynamic> getDataWithCustomerAuth(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    try {
      var response =
          await restClientCustomer.dio!.get('${restClient.customerURL}$path',
              options: Options(headers: {
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
                'X-user': 'customer',
                'Connection': 'keep-alive',
                'Accept-encoding': 'gzip, deflate, br',
                'Accept': '*/*',
                'User-Agent': 'PostmanRuntime/7.29.2',
                'Authorization':
                    'Bearer ${GetIt.I<CustomerTokenCubit>().state}',
                'Cookie': 'PHPSESSID=${customerTokenModel.cookie}'
              }),
              queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }

  ///

  // static Future<dynamic> getDataPayments(
  //     {required String path,
  //     Options? options,
  //     Map<String, dynamic>? queries}) async {
  //   try {
  //     var response = await restClient.dio!.get('${restClient.customerURL}$path',
  //         options: options, queryParameters: queries);
  //     return response.data;
  //   } on DioError catch (error) {
  //     throw error.message;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  static Future<dynamic> getDataKibanda(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    try {
      Dio dio = Dio();
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));

      var response = await dio.get('${restClient.customerURL}$path',
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'X-user': 'customer',
            'Connection': 'keep-alive',
            'Accept-encoding': 'gzip, deflate, br',
            'Accept': '*/*',
            'User-Agent': 'PostmanRuntime/7.29.2',
            'Authorization': 'Bearer ${customerTokenModel.token}',
          }),
          queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }
}
