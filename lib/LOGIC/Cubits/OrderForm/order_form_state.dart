part of 'order_form_cubit.dart';

const selectedInitialValue = SelectedValues.initial();

enum FormClientState { newClient, existingClient }

enum FormDeliveryState { delivery, import, immediate }

enum FormRequestState { idle, loading, success, error }

final class OrderFormState {
  final bool isClient;
  final int deliveryMethodIndex;
  final SelectedValues selectedValues;
  final FormDeliveryState deliveryState;
  final FormClientState clientState;
  final FormRequestState netState;
  const OrderFormState(
      {required this.isClient,
      required this.deliveryMethodIndex,
      required this.selectedValues,
      required this.clientState,
      required this.netState,
      required this.deliveryState});
  const OrderFormState.initial(
      {this.isClient = true,
      this.deliveryMethodIndex = 0,
      this.selectedValues = selectedInitialValue,
      this.clientState = FormClientState.newClient,
      this.netState = FormRequestState.idle,
      this.deliveryState = FormDeliveryState.delivery});
  OrderFormState copyWith(
      {bool? isClient,
      int? deliveryMethodIndex,
      SelectedValues? selectedValues,
      FormDeliveryState? deliveryState,
      FormClientState? clientState,
      FormRequestState? netState}) {
    return OrderFormState(
        isClient: isClient ?? this.isClient,
        deliveryMethodIndex: deliveryMethodIndex ?? this.deliveryMethodIndex,
        selectedValues: selectedValues ?? this.selectedValues,
        deliveryState: deliveryState ?? this.deliveryState,
        clientState: clientState ?? this.clientState,
        netState: netState ?? this.netState);
  }
}
