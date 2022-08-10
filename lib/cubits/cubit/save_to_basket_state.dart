part of 'save_to_basket_cubit.dart';

@freezed
class SaveToBasketState with _$SaveToBasketState {
  const factory SaveToBasketState.initial() = _Initial;
  const factory SaveToBasketState.success() = _Success;
  const factory SaveToBasketState.loading() = _Loasding;
  const factory SaveToBasketState.failed(String e) = _Failed;
}
