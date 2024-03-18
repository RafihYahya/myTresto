import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tresto_v002a/LOGIC/Blocs/AppStatus/app_status_state.dart';

part 'app_status_event.dart';

class AppStatusBloc extends Bloc<AppStatusEvent, AppStatusState> {
  AppStatusBloc() : super(AppStatusState.initial()) {
    on<CheckApiStatus>(printApiStatus);
  }

  void printApiStatus(CheckApiStatus event, Emitter<AppStatusState> emit) {
    print(state.apiStatus);
  }
}
