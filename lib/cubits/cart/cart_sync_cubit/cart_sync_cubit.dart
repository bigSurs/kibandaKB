import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'cart_sync_state.dart';
part 'cart_sync_cubit.freezed.dart';

class CartSyncCubit extends Cubit<CartSyncState> {
  CartSyncCubit() : super(CartSyncState.initial());

  updateCart({required Map<String, dynamic> data}) async {
    emit(CartSyncState.loading());
    try {
      var response = await ApiService.postData(
          data: data, path: '/customer/cart/cartproduct');
      emit(CartSyncState.success());
    } catch (e) {
      emit(CartSyncState.failed(e.toString()));
    }
  }
}
