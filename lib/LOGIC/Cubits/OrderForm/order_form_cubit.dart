import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tresto_v002a/Global/constants.dart';
import 'package:tresto_v002a/LOGIC/Models/create_order_model.dart';
import 'package:tresto_v002a/Layout/Pages/Orders/create_order_page.dart';

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
      _ => throw Exception('Value Higher Than Expected'),
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

  bool theGrandValidator(List<GlobalKey<FormState>> keys) {
    var [key1, key2, key3, key4, key5] = keys;
    if (state.clientState == FormClientState.newClient) {
      if (!key1.currentState!.validate()) {
        return switch (state.deliveryState) {
          FormDeliveryState.delivery => key3.currentState!.validate(),
          FormDeliveryState.import => key4.currentState!.validate(),
          FormDeliveryState.immediate => key5.currentState!.validate(),
        };
      } else {
        return switch (state.deliveryState) {
          FormDeliveryState.delivery => key3.currentState!.validate(),
          FormDeliveryState.import => key4.currentState!.validate(),
          FormDeliveryState.immediate => key5.currentState!.validate(),
        };
      }
    } else {
      if (!key2.currentState!.validate()) {
        return switch (state.deliveryState) {
          FormDeliveryState.delivery => key3.currentState!.validate(),
          FormDeliveryState.import => key4.currentState!.validate(),
          FormDeliveryState.immediate => key5.currentState!.validate(),
        };
      } else {
        return switch (state.deliveryState) {
          FormDeliveryState.delivery => key3.currentState!.validate(),
          FormDeliveryState.import => key4.currentState!.validate(),
          FormDeliveryState.immediate => key5.currentState!.validate(),
        };
      }
    }
  }
}
