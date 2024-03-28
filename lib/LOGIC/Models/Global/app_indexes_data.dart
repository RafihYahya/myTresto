enum Status { success, loading, error }

class AppIndexes {
  final int restoIndex;
  final int index;
  final int maxRestoNumber;
  final Status status;

  AppIndexes(
      {required this.index,
      required this.restoIndex,
      required this.maxRestoNumber,
      required this.status});

  AppIndexes.initial(
      {this.index = 0,
      this.restoIndex = 0,
      this.maxRestoNumber = 0,
      this.status = Status.loading});

  AppIndexes copyWith(
      {int? index, int? restoIndex, int? maxRestoNumber, Status? status}) {
    return AppIndexes(
        index: index ?? this.index,
        restoIndex: restoIndex ?? this.restoIndex,
        maxRestoNumber: maxRestoNumber ?? this.maxRestoNumber,
        status: status ?? this.status);
  }
}
