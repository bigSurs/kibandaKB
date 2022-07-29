import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_prodcuts.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';

part 'vendor_cubits_state.dart';
part 'vendor_cubits_cubit.freezed.dart';

class VendorCubitsCubit extends Cubit<VendorCubitsState> {
  VendorCubitsCubit() : super(VendorCubitsState.initial());

  getvendorprducts() async {
    emit(const VendorCubitsState.loading());
    try {
      var response = await RestClient().dio!.get(
          'https://stage.salesexecutiveapi.kwikbasket.com/api/products',
          queryParameters: {
            'order_status_id': 1,
          });
      List prodcutsinJson = response.data['data']['products'][''];
      List<VendorProdcuts> products = prodcutsinJson.map((e) {
        return VendorProdcuts.fromJson(e);
      }).toList();

      // Map<String, dynamic> map = json.decode(response.data['data']);
      // // ignore: prefer_typing_uninitialized_variables
      // var ordersinJson;
      // List<AssignedOrder> orders = List.generate(ordersinJson.length,
      //     ((index) => AssignedOrder.fromJson(ordersinJson[index])));
      // print(orders[0]);

      emit(VendorCubitsState.success(assignedProducts: products));
    } catch (e) {
      emit(VendorCubitsState.failed());
    }
  }
}
