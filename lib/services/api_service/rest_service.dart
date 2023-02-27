import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/authentication/customer_token.dart';
import 'package:kibanda_kb/models/customer_token_model.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client_customer.dart';
import 'package:kibanda_kb/utilities/utilities.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestService {
  postData({required data, required String path}) async {
    Dio dio = Dio();
    RestClient restClient = RestClient();
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    try {
      var response = await dio.post('${restClient.customerURL}$path',
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'x-user': 'customer',
            'Authorization': 'Bearer ${customerTokenModel.token}',
            'Cookie': 'PHPSESSID=${customerTokenModel.cookie}'
          }));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  postDataCustomer({required data, required String path}) async {
    Dio dio = Dio();
    RestClientCustomer restClient = RestClientCustomer();
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    try {
      var response = await dio.post('${restClient.customerURL}$path',
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'x-user': 'customer',
            'Authorization': 'Bearer ${customerTokenModel.token}',
            'Cookie': 'PHPSESSID=${customerTokenModel.cookie}'
          }));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  getData({required String path, Map<String, dynamic>? queries}) async {
    Dio dio = Dio();
    RestClient restClient = RestClient();
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    try {
      var response = await dio.get('${restClient.customerURL}$path',
          queryParameters: queries,
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'X-User': 'customer',
            'Authorization': 'Bearer ${customerTokenModel.token}',
            'Cookie': 'PHPSESSID=${customerTokenModel.cookie}'
          }));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  getDataCustomer({required String path, Map<String, dynamic>? queries}) async {
    Dio dio = Dio();
    RestClientCustomer restClient = RestClientCustomer();
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    try {
      var response = await dio.get('${restClient.customerURL}$path',
          queryParameters: queries!,
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'X-User': 'customer',
            'Authorization': 'Bearer ${customerTokenModel.token}',
            'Cookie': 'PHPSESSID=${customerTokenModel.cookie}'
          }));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }
}
