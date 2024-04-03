final class SelectedValues {
  final String? selectedZoneValue;
  final String? selectedDelayValue;
  final String? selectedTimeValue;
  final String? selectedTableValue;
  final String? selectedClientValue;

  SelectedValues(
      {this.selectedDelayValue,
      this.selectedTimeValue,
      this.selectedZoneValue,
      this.selectedTableValue,
      this.selectedClientValue});

  const SelectedValues.initial()
      : selectedClientValue = null,
        selectedDelayValue = null,
        selectedTableValue = null,
        selectedTimeValue = null,
        selectedZoneValue = null;
}