part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersReady extends OrdersState {
  final OrderRestoList ordersRestoList;
  final bool isAlreadyLoadedOnce;
  final bool isStreamActive;
  OrdersReady(
      {required this.ordersRestoList,
      required this.isAlreadyLoadedOnce,
      required this.isStreamActive});

  OrdersReady copyWith(
      { OrderRestoList? ordersRestoList,
       bool? isAlreadyLoadedOnce,
       bool? isStreamActive}) {
    return OrdersReady(
        ordersRestoList: ordersRestoList ?? this.ordersRestoList,
        isAlreadyLoadedOnce: isAlreadyLoadedOnce ?? this.isAlreadyLoadedOnce,
        isStreamActive: isStreamActive ?? this.isStreamActive);
  }
}

final class OrdersError extends OrdersState {}
