// import 'dart:convert';
// import 'dart:developer';

// import 'package:auto_route/auto_route.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'package:kibanda_kb/constants/constants.dart';
// import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';
// import 'package:kibanda_kb/utilities/utils/utils.dart';


// enum APIHelperMethod { POST, GET, PUT, DELETE }

// class APIHelper {
//   static RestClient restClient = GetIt.I.get<RestClient>();
//   static Future<dynamic> api(url, body, APIHelperMethod method,
//       {header, String prefix = ""}) async {
//     try {
//       if (!await isConnectNetwork()) {
//         AutoRouter.of(Constants.navigatorKey.currentContext!)
//             .replace(NoInternetRoute());
//         // Navigator.of(Constants.navigatorKey.currentContext!)
//         //     .pushReplacementNamed(PageRoutes.no_internet_page);

//         return null;
//       }

//       String completeUrl;

//       if (prefix.isEmpty) {
//         completeUrl = "${APIRoutes.api_url}$url";
//       } else {
//         completeUrl = prefix + url;
//       }

//       print(completeUrl);

//       Map<String, String> headers = {};

//       final token = GetIt.I<TokenCubit>().state;
//       if (token != null) {
//         headers.addAll({"Authorization": token});
//       }
//       if (json == null || json == false) {
//         headers.addAll({
//           "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
//         });
//       }
//       if (header != null) {
//         headers.addAll(header);
//       }
//       Response? response;
//       switch (method) {
//         case APIHelperMethod.POST:
//           var response = await restClient.dio!.post(completeUrl,
//               data: body,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           return response.data;
//           break;
//         case APIHelperMethod.GET:
//           var response = await restClient.dio!.get(completeUrl,
//               options: Options(headers: {
//                 // 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 ...headers,
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           return response.data;
//         case APIHelperMethod.DELETE:
//           response = await restClient.dio!.delete(completeUrl,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         case APIHelperMethod.PUT:
//           response = await restClient.dio!.put(completeUrl,
//               data: body,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         default:
//           break;
//       }

//       log(response!.statusCode.toString());
//       // log(decode.toString());

//       // if (response.statusCode == 200 || response.statusCode == 201) {
//       //   return response.data;
//       // }

//       // if (response.statusCode == 400) {
//       //   log("400");
//       //   return response.data;
//       // }

//       return null;
//     } on DioError catch (e) {
//       try {
//         if (e.response!.data.containsKey("message")) {
//           messageTost(e.response!.data["message"][0]['body']);
//         } else {
//           messageTost('An error has occured');
//         }
//       } catch (e) {
//         messageTost('An error has occured');
//       }
//     } catch (e) {
//       print(e);

//       messageTost('Please try again...');
//       return null;
//     }
//   }

//   static Future<dynamic> apiWithoutDecode(
//       String url, body, APIHelperMethod method,
//       {header}) async {
//     try {
//       if (!await isConnectNetwork()) {
//         AutoRouter.of(Constants.navigatorKey.currentContext!)
//             .replace(NoInternetRoute());
//         // Navigator.of(Constants.navigatorKey.currentContext!)
//         //     .pushReplacementNamed(PageRoutes.no_internet_page);

//         return null;
//       }
//       url = "${APIRoutes.api_url}$url";
//       print(url);

//       Map<String, String> headers = {};

//       final token = GetIt.I<TokenCubit>().state;
//       if (token != null) {
//         headers.addAll({"Authorization": token});
//       }
//       headers.addAll({
//         "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
//       });
//       if (header != null) {
//         headers.addAll(header);
//       }
//       Response? response;
//       switch (method) {
//         case APIHelperMethod.POST:
//           var response = await restClient.dio!.post(url,
//               data: body,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           return response.data;

//         case APIHelperMethod.GET:
//           response = await restClient.dio!.get(url,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         case APIHelperMethod.DELETE:
//           response = await restClient.dio!.delete(url,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         case APIHelperMethod.PUT:
//           response = await restClient.dio!.put(url,
//               data: body,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         default:
//           break;
//       }

//       if (response!.statusCode == 200 || response.statusCode == 201) {
//         return response.data;
//       }

//       if (response.statusCode == 400) {
//         log("400");
//         return response.data;
//       }

//       return null;
//     } catch (e) {
//       print(e);

//       messageTost('Please try again...');
//       return null;
//     }
//   }

//   static Future<dynamic> mepesaapi(url, body, APIHelperMethod method,
//       {header}) async {
//     try {
//       if (!await isConnectNetwork()) {
//         AutoRouter.of(Constants.navigatorKey.currentContext!)
//             .replace(NoInternetRoute());
//         // Navigator.of(Constants.navigatorKey.currentContext!)
//         //     .pushReplacementNamed(PageRoutes.no_internet_page);

//         return null;
//       }
//       // url = Uri.parse("$url");
//       print(url);

//       Map<String, String> headers = {};

//       if (header != null) {
//         headers.addAll(header);
//       }
//       Response? response;
//       switch (method) {
//         case APIHelperMethod.POST:
//           var response = await restClient.dio!.post(url,
//               data: body,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           return response.data;
//         case APIHelperMethod.GET:
//           response = await restClient.dio!.get(url,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         case APIHelperMethod.DELETE:
//           response = await restClient.dio!.delete(url,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         case APIHelperMethod.PUT:
//           response = await restClient.dio!.put(url,
//               data: body,
//               options: Options(headers: {
//                 'Cookie': 'PHPSESSID=${AppSingleTone().cartSessionId}',
//                 'Content-Type':
//                     'application/x-www-form-urlencoded; charset=UTF-8',
//                 'X-User': 'customer'
//               }));
//           break;
//         default:
//           break;
//       }

//       final decode = json.decode(response!.data);

//       log(response.statusCode.toString());
//       // log(decode.toString());

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return decode;
//       }

//       if (response.statusCode == 400) {
//         log("400");
//         return decode;
//       }

//       return null;
//     } catch (e) {
//       print(e);

//       messageTost('Please try again...');
//       return null;
//     }
//   }

//   // static void mapURL() async {
//   //   var request = http.Request(
//   //       'GET',
//   //       Uri.parse(
//   //           'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=kenya&key=AIzaSyCiMBCIxWmuh1TVf4u6xJzYZS_xhFe04so'));

//   //   http.StreamedResponse response = await request.send();

//   //   if (response.statusCode == 200) {
//   //     print(await response.stream.bytesToString());
//   //   } else {
//   //     print(response.reasonPhrase);
//   //   }
//   // }

//   // 'Cookie':
//   //           'PHPSESSID=hu8p6f6d481e47e2up53aif8i3; currency=KES; language=en'
// }
