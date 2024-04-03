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

  SelectedValues copyWith({
    String? selectedZoneValue,
    String? selectedDelayValue,
    String? selectedTimeValue,
    String? selectedTableValue,
    String? selectedClientValue,
  }) {
    return SelectedValues(
      selectedClientValue: selectedClientValue ?? this.selectedClientValue,
      selectedZoneValue: selectedZoneValue ?? this.selectedZoneValue,
      selectedDelayValue: selectedDelayValue ?? this.selectedDelayValue,
      selectedTimeValue: selectedTimeValue ?? this.selectedTimeValue,
      selectedTableValue: selectedTableValue ?? this.selectedTableValue,
    );
  }

  @override
  String toString() {
    return '{zone:$selectedZoneValue,delay:$selectedDelayValue,time:$selectedTimeValue,table:$selectedTableValue,client:$selectedClientValue}';
  }
}
