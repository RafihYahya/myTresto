import 'package:bloc/bloc.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Models/create_order_model.dart';

part 'order_form_state.dart';

class OrderFormCubit extends Cubit<OrderFormState> {
  OrderFormCubit() : super(const OrderFormState.initial());

  void toggleisClient(bool value) {
    if (value == false) {
      emit(state.copyWith(
          isClient: value, clientState: FormClientState.existingClient));
    } else {
      emit(state.copyWith(
          isClient: value, clientState: FormClientState.newClient));
    }
  }

  

  void changeDeliveryIndex(int value) {
    return switch (value) {
      0 => emit(state.copyWith(
          deliveryMethodIndex: value,
          deliveryState: FormDeliveryState.delivery)),
      1 => emit(state.copyWith(
          deliveryMethodIndex: value, deliveryState: FormDeliveryState.import)),
      2 => emit(state.copyWith(
          deliveryMethodIndex: value,
          deliveryState: FormDeliveryState.immediate)),
      _ => logger.w('Value Higher Than Expected Index'),
    };
  }

  void updateSelectedValues(SelectedValues values) {
    emit(state.copyWith(
        selectedValues: state.selectedValues.copyWith(
            selectedClientValue: values.selectedClientValue,
            selectedDelayValue: values.selectedDelayValue,
            selectedTableValue: values.selectedTableValue,
            selectedTimeValue: values.selectedTimeValue,
            selectedZoneValue: values.selectedZoneValue)));
    logger.d(state.selectedValues);
  }
}
