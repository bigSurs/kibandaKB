import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/models/address/address.dart';

class DeliveryAddressSelectionCubit extends HydratedCubit<Address?> {
  DeliveryAddressSelectionCubit(Address? initialState) : super(initialState);
  save(Address address) {
    emit(address);
  }

  @override
  Address? fromJson(Map<String, dynamic> json) {
    Address.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(Address? state) {
    state!.toJson();
  }
}
