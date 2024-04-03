import 'package:bloc/bloc.dart';
import 'package:tresto_v002a/LOGIC/Models/create_order_model.dart';

part 'order_form_state.dart';

class OrderFormCubit extends Cubit<OrderFormState> {
  OrderFormCubit() : super(const OrderFormState.initial());

  void toggleisClient(bool value) {
    emit(state.copyWith(isClient: value));
  }

  void changeDeliveryIndex(int value) {
    emit(state.copyWith(deliveryMethodIndex: value));
  }

  void updateSelectedValues(SelectedValues values) {
    emit(state.copyWith(selectedValues: values));
  }
}
