import 'package:bloc/bloc.dart';

part 'order_form_state.dart';

class OrderFormCubit extends Cubit<OrderFormState> {
  OrderFormCubit() : super(const OrderFormState.initial());

  void toggleisClient(bool value) {
    emit(state.copyWith(isClient: value));
  }

  void changeDeliveryIndex(int value) {
    emit(state.copyWith(deliveryMethodIndex: value));
  }

  void updateSelectedDeliveryZoneValue(String value) {
    emit(state.copyWith(selectedDeliveryValue: value));
  }

  void updateSelectedDeliveryDelayValue(String value) {
    emit(state.copyWith(selectedDeliveryDelayValue: value));
  }
}
