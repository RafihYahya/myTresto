part of 'order_form_cubit.dart';



const selectedInitialValue = SelectedValues.initial();

final class OrderFormState {
  final bool isClient;
  final int deliveryMethodIndex;
  final SelectedValues selectedValues;
  const OrderFormState(
      {required this.isClient,
      required this.deliveryMethodIndex,
      required this.selectedValues});
  const OrderFormState.initial(
      {this.isClient = true,
      this.deliveryMethodIndex = 0,
      this.selectedValues = selectedInitialValue});
  OrderFormState copyWith({
    bool? isClient,
    int? deliveryMethodIndex,
    SelectedValues? selectedValues,
  }) {
    return OrderFormState(
        isClient: isClient ?? this.isClient,
        deliveryMethodIndex: deliveryMethodIndex ?? this.deliveryMethodIndex,
        selectedValues: selectedValues ?? this.selectedValues);
  }
}
