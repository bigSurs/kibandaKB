// import 'dart:convert';

// import 'package:kibanda_kb/constants/constants.dart';
// import 'package:kibanda_kb/utilities/utils/utils.dart';



// class CartModel {
//   int? id;
//   String? productId;
//   String? productStoreId;
//   String? variantName;
//   String? productName;
//   String? productThumb;
//   Map<String, num>? type;
//   String? notes;
//   String? priceSymbol;
//   String? percentageOff;
//   String? storeId;
//   String? storeName;
//   num? discount_price;
//   String? discount_percentage;
//   String? taxName;
//   num? productPrice;
//   num? productRate;
//   num? qty;
//   num? weight;
//   num? subTotal;
//   num? total;
//   num? tax;
//   String? taxClassId;
//   String? taxPercentage;

//   num? taxAmount;
//   num? storeProductVariationId;

//   CartModel({
//     this.id,
//     this.productId,
//     this.productStoreId,
//     this.variantName,
//     this.productName,
//     this.productThumb,
//     this.type,
//     this.notes,
//     this.priceSymbol,
//     this.percentageOff,
//     this.storeId,
//     this.storeName,
//     this.productPrice,
//     this.productRate,
//     this.qty,
//     this.weight,
//     this.total,
//     this.subTotal,
//     this.discount_percentage,
//     this.discount_price,
//     this.tax,
//     this.taxClassId,
//     this.taxPercentage,
//     this.taxName,
//     this.taxAmount,
//     this.storeProductVariationId,
//   });

//   factory CartModel.fromJson(data) {
//     Map<String, num> _type = {};
//     num? taxPercentage = getNumPrice(data['taxPercentage']);

//     if (taxPercentage == null) {
//       taxPercentage = 0;
//     }

//     num qty = data["qty"];
//     num rate = data["productRate"];
//     num subTotal = qty * rate;
//     num total = subTotal + (subTotal * (taxPercentage / 100));
//     num tax = rate * (taxPercentage / 100);
//     // num total = subTotal;
//     // num tax = 0;

//     Map map = jsonDecode(data["type"]);
//     map.forEach((key, value) {
//       _type.addAll({key: decimalToNum(value)!});
//     });

//     return CartModel(
//       id: data["id"],
//       productStoreId: data["productStoreId"],
//       variantName: data["variationName"],
//       productName: data["productName"],
//       productThumb: data["productThumb"],
//       type: _type,
//       notes: data["notes"],
//       priceSymbol: data["priceSymbol"],
//       productRate: data["productRate"],
//       qty: qty,
//       weight: data["weight"],
//       total: total,
//       tax: tax,
//       subTotal: subTotal,
//       percentageOff: data["percentageOff"],
//       productId: data["productId"],
//       productPrice: data["productPrice"],
//       storeId: data["storeId"],
//       storeName: data["storeName"],
//       taxClassId: data['taxClassId'],
//       taxName: data['taxName'],
//       taxAmount: data['taxAmount'],
//       discount_price: getNumPrice2(data['discount_price'] as String),
//       discount_percentage: data['discount_percentage'],
//       taxPercentage: data['taxPercentage'],
//       storeProductVariationId: data['storeProductVariationId'],
//     );
//   }

//   static Map<String, dynamic> toJson(CartModel data) {
//     return {
//       "productStoreId": data.productStoreId,
//       "variationName": data.variantName,
//       "productName": data.productName,
//       "productThumb": data.productThumb,
//       "type": json.encode(data.type),
//       "notes": data.notes,
//       "priceSymbol": data.priceSymbol,
//       "productRate": data.productRate,
//       "qty": data.qty,
//       "weight": data.weight,
//       "percentageOff": data.percentageOff,
//       "productId": data.productId,
//       "productPrice": data.productPrice,
//       "storeId": data.storeId,
//       "storeName": data.storeName,
//       "taxClassId": data.taxClassId,
//       "taxName": data.taxName,
//       "taxAmount": data.taxAmount,
//       "taxPercentage": data.taxPercentage,
//       "storeProductVariationId": data.storeProductVariationId,
//     };
//   }

//   factory CartModel.fromAPI(data) {
//     Map<String, num> _type = {};
//     num taxPercentage = data['tax_percentage'] == null
//         ? 0
//         : getNumPrice(data['tax_percentage'])!;
//     num qty = data["quantity"];
//     num rate = getNumPrice(data["special_price"])!;
//     num subTotal = qty * rate;
//     // num total = subTotal;
//     num total = subTotal + (subTotal * (taxPercentage / 100));
//     num tax = rate * (taxPercentage / 100);
//     // num tax = 0;

//     if (data["produce_type"] != null) {
//       print("-cart load on app start ${data["produce_type"][0]["type"]}");
//       var encode = data["produce_type"][0]["type"].toString();
//       var list = encode.split(",");
//       list.forEach((element) {
//         var data = element.split("-");
//         _type.addAll({
//           data[0]: num.tryParse(data[1])!,
//         });
//       });
//     }

//     // Map map = json.decode(encode);
//     // map.forEach((key, value) {
//     //   _type.addAll({key: decimalToNum(value)});
//     // });

//     return CartModel(
//       productStoreId: data["product_store_id"],
//       variantName: data["unit"],
//       productName: data["name"],
//       productThumb: data["image"],
//       type: _type,
//       notes: data["product_note"],
//       priceSymbol: Constants.price_symbole,
//       productRate: rate,
//       qty: qty,
//       weight: data["weight"],
//       total: total,
//       tax: tax,
//       subTotal: subTotal,
//       percentageOff: data["percentage_off"].toString(),
//       productId: data["product_id"],
//       productPrice: getNumPrice(data["price"]),
//       storeId: data["store_id"],
//       storeName: data["store_name"],
//       taxClassId: data['tax_class_id'],
//       taxName: data['tax_name'],
//       taxAmount: getNumPrice(data['tax_amount']),
//       discount_price: getNumPrice2(data['discount_price'] as String),
//       taxPercentage: taxPercentage.toString(),
//       storeProductVariationId: getNumPrice(data['store_product_variation_id']),
//     );
//   }
// }
