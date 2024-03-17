import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tresto_v002a/LOGIC/Models/GlobalModeles/app_indexes_data.dart';

class IndexesCubit extends Cubit<AppIndexes> {
  IndexesCubit(super.initialState);

//Cubit Responsible For The Index variable and the restoname index variable
  void changeIndex({required int index}) {
    emit(AppIndexes(index: index, restoIndex: state.restoIndex));
  }

  void changeRestoIndex({required int restoIndex}) {
    emit(AppIndexes(index: state.index, restoIndex: restoIndex));
  }
}
