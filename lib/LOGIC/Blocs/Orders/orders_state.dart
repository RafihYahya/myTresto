part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersReady extends OrdersState {
  final OrderRestoList ordersRestoList;
  OrdersReady({required this.ordersRestoList});
}

final class OrdersError extends OrdersState {}
