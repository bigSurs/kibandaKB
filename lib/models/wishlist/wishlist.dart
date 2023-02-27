import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist.freezed.dart';
part 'wishlist.g.dart';

@freezed
class Wishlist with _$Wishlist {
  factory Wishlist(
      {String? name,
      String? wishlist_id,
      String? date_added,
      int? product_count,
      List? products}) = _Wishlist;

  factory Wishlist.fromJson(Map<String, dynamic> json) =>
      _$WishlistFromJson(json);
}
