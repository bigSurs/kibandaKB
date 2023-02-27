part of 'lipa_na_mpesa_cubit.dart';

@freezed
class LipaNaMpesaState with _$LipaNaMpesaState {
  const factory LipaNaMpesaState.initial() = _Initial;
  const factory LipaNaMpesaState.requesting() = _Requesting;
  const factory LipaNaMpesaState.requested() = _Requested;
  const factory LipaNaMpesaState.confirming() = _Confirming;
  const factory LipaNaMpesaState.confirmed() = _Confirmed;
  const factory LipaNaMpesaState.failed(String e) = _Failed;
}
