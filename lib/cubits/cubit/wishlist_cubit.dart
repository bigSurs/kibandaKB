import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/wishlist/wishlist.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'wishlist_state.dart';
part 'wishlist_cubit.freezed.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistState.initial());
  getWishLists() async {
    emit(WishlistState.loading());
    try {
      var response =
          await ApiService.getData(path: '/customer/wishlist/userlist');
      List wishlistJson = response['data']['wishlists'];
      emit(WishlistState.success(List.generate(wishlistJson.length,
          (index) => Wishlist.fromJson(wishlistJson[index]))));
    } catch (e) {
      emit(WishlistState.failed(e.toString()));
    }
  }
}
