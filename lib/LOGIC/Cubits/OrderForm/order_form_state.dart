part of 'order_form_cubit.dart';

const selectedInitialValue = SelectedValues.initial();

enum FormClientState { newClient, existingClient }

enum FormDeliveryState { delivery, import, immediate }

final class OrderFormState {
  final bool isClient;
  final int deliveryMethodIndex;
  final SelectedValues selectedValues;
  final FormDeliveryState deliveryState;
  final FormClientState clientState;
  const OrderFormState(
      {required this.isClient,
      required this.deliveryMethodIndex,
      required this.selectedValues,
      required this.clientState,
      required this.deliveryState});
  const OrderFormState.initial(
      {this.isClient = true,
      this.deliveryMethodIndex = 0,
      this.selectedValues = selectedInitialValue,
      this.clientState = FormClientState.newClient,
      this.deliveryState = FormDeliveryState.delivery});
  OrderFormState copyWith(
      {bool? isClient,
      int? deliveryMethodIndex,
      SelectedValues? selectedValues,
      FormDeliveryState? deliveryState,
      FormClientState? clientState}) {
    return OrderFormState(
        isClient: isClient ?? this.isClient,
        deliveryMethodIndex: deliveryMethodIndex ?? this.deliveryMethodIndex,
        selectedValues: selectedValues ?? this.selectedValues,
        deliveryState: deliveryState ?? this.deliveryState,
        clientState: clientState ?? this.clientState);
  }
}
