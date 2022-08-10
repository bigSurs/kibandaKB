import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'save_to_basket_state.dart';
part 'save_to_basket_cubit.freezed.dart';

class SaveToBasketCubit extends Cubit<SaveToBasketState> {
  SaveToBasketCubit() : super(SaveToBasketState.initial());

  saveToBasket({required Map<String, dynamic> data}) async {
    emit(SaveToBasketState.loading());
    try {
      var response = await ApiService.postData(
          data: data, path: '/customer/wishlist/CreateWishlistWithProduct');
      emit(SaveToBasketState.success());
    } catch (e) {
      emit(SaveToBasketState.failed(e.toString()));
    }
  }
}
