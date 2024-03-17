import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Blocs/test_state.dart';

enum TestEvent {printAdd,printAddTwice}
class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc(super.initialState) {
    on<TestEvent>((event, emit) {
      if(event == TestEvent.printAdd) {
         
        emit(state.copyWith(index: state.index + 1));
      }
      
    });
  }
}