import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_status_event.dart';
part 'app_status_statev1.dart.olf';

class AppStatusBloc extends Bloc<AppStatusEvent, AppStatusState> {
  AppStatusBloc() : super(AppStatusInitial()) {

    on<CheckApiStatus>((event, emit) {
      print('object');
    });
  }
}
