part of 'order_form_cubit.dart';

final class OrderFormState {
  final bool isClient;
  final int deliveryMethodIndex;
  final String selectedDeliveryValue;
  final String selectedDeliveryDelayValue;
  const OrderFormState(
      {required this.isClient,
      required this.deliveryMethodIndex,
      required this.selectedDeliveryDelayValue,
      required this.selectedDeliveryValue});
  const OrderFormState.initial(
      {this.isClient = true,
      this.deliveryMethodIndex = 0,
      this.selectedDeliveryDelayValue = '',
      this.selectedDeliveryValue = ''});
  OrderFormState copyWith(
      {bool? isClient,
      int? deliveryMethodIndex,
      String? selectedDeliveryValue,
      String? selectedDeliveryDelayValue}) {
    return OrderFormState(
        isClient: isClient ?? this.isClient,
        deliveryMethodIndex: deliveryMethodIndex ?? this.deliveryMethodIndex,
        selectedDeliveryValue:
            selectedDeliveryValue ?? this.selectedDeliveryValue,
        selectedDeliveryDelayValue:
            selectedDeliveryDelayValue ?? this.selectedDeliveryDelayValue);
  }
}
