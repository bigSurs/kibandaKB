import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';

import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';

part 'vendor_products_state.dart';
part 'vendor_products_cubit.freezed.dart';

class VendorProductsCubit extends Cubit<VendorProductsState> {
  VendorProductsCubit() : super(VendorProductsState.initial());

  getvendorprducts() async {
    emit(const VendorProductsState.loading());
    try {
      var response = await RestClient().dio!.get(
          'https://stage.salesexecutiveapi.kwikbasket.com/api/products',
          queryParameters: {
            'order_status_id': 1,
          });
      List prodcutsinJson = response.data['data']['products'][''];
      List<VendorProducts> products = prodcutsinJson.map((e) {
        return VendorProducts.fromJson(e);
      }).toList();

      // Map<String, dynamic> map = json.decode(response.data['data']);
      // // ignore: prefer_typing_uninitialized_variables
      // var ordersinJson;
      // List<AssignedOrder> orders = List.generate(ordersinJson.length,
      //     ((index) => AssignedOrder.fromJson(ordersinJson[index])));
      // print(orders[0]);

      emit(VendorProductsState.success(assignedProducts: products));
    } catch (e) {
      emit(VendorProductsState.failed());
    }
  }
}
