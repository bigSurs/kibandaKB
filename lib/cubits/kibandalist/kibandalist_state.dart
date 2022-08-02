part of 'kibandalist_cubit.dart';

@freezed
class KibandalistState with _$KibandalistState {
  const factory KibandalistState.initial() = _Initial;
  const factory KibandalistState.loading() = _Loading;
  const factory KibandalistState.success({List<Kibanda>? kibandaskistores}) =
      _Success;
  const factory KibandalistState.failed() = _Failed;
}
