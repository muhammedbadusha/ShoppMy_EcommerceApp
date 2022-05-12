part of 'all_productsbloc_bloc.dart';

@immutable
abstract class AllProductsblocState {}

class AllProductsblocInitial extends AllProductsblocState {}

class AllProductsblcLoading extends AllProductsblocState {}
class AllProductsblocLoaded extends AllProductsblocState {}
class AllProductsblocError extends AllProductsblocState {}

