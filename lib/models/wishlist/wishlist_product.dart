
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_product.freezed.dart';
part 'wishlist_product.g.dart';

@freezed
class WishlistProduct with _$WishlistProduct {
  factory WishlistProduct({
    String? name,
    String? wishlist_id,
    String? product_id,
    String? product_store_id,
    String? store_id,
    String? quantity,
    String? image,
    String? unit,
    
  }) = _WishlistProduct;
	
  factory WishlistProduct.fromJson(Map<String, dynamic> json) =>
			_$WishlistProductFromJson(json);
}
