import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/kibanda_model/kibanda.dart';
import 'package:kibanda_kb/models/vendor_prodcuts/vendor_products.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';

part 'vendor_products_state.dart';
part 'vendor_products_cubit.freezed.dart';

class VendorProductsCubit extends Cubit<VendorProductsState> {
  VendorProductsCubit() : super(VendorProductsState.initial());

  getVendorProductsByAllCategories(
      {
      required int customerId
      }) async {
    emit(const VendorProductsState.loading());
    try {
      await ApiService.post(data: {
        'customer_id': customerId,
        // 'products':
        //     List.generate(products.length, (index) => products[index].toJson())
      }, path: 'kibandalist');
      emit(const VendorProductsState.success());
    } catch (e) {
      emit(VendorProductsState.failed(e.toString()));
    }
  }
}


