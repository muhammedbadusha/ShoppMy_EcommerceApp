part of 'id_products_bloc.dart';

@immutable
abstract class IdProductsState {}

class IdProductsInitial extends IdProductsState {}

class ProductIdLoading extends IdProductsState {}
class ProductIdLoaded extends IdProductsState {}
class ProductIdError extends IdProductsState {}

