part of 'product_category_cubit.dart';

@freezed
class ProductCategoryState with _$ProductCategoryState {
  const factory ProductCategoryState.initial() = _Initial;
  const factory ProductCategoryState.loading() = _Loading;
  const factory ProductCategoryState.success(List<ProductCategory> categories) =
      _Success;
  const factory ProductCategoryState.failed(String error) = _Failed;
}
