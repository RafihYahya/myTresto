part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}

final class OrdersInit extends OrdersEvent {}

final class GetOrders extends OrdersEvent{}

final class UpdateOrder extends OrdersEvent {}

final class RemoveOrder extends OrdersEvent {}

final class NewOrder extends OrdersEvent {}






