import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_status_event.dart';
part 'app_status_state.dart';

class AppStatusBloc extends Bloc<AppStatusEvent, AppStatusState> {
  AppStatusBloc() : super(AppStatusInitial()) {
    on<CheckApi>((event, emit) {
      print('object');
    });
  }
}
