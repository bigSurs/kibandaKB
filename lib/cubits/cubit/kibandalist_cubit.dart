import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/kibanda_model/kibanda.dart';
import 'package:kibanda_kb/utilities/utilities.dart';

part 'kibandalist_state.dart';
part 'kibandalist_cubit.freezed.dart';

class KibandalistCubit extends Cubit<KibandalistState> {
  KibandalistCubit() : super(KibandalistState.initial());

  getVibandas() async {
    emit(const KibandalistState.loading());
    try {
      var response = await RestClient().dio!.get(
          'https://stage.salesexecutiveapi.kwikbasket.com/api/kibandalist');
      List kibandasinJson = response.data['data'];
      List<Kibanda> kibandaskis = kibandasinJson.map((e) {
        return Kibanda.fromJson(e);
      }).toList();
      emit(KibandalistState.success(kibandaskistores: kibandaskis));
    } catch (e) {
      emit(KibandalistState.failed());
    }
  }
}
