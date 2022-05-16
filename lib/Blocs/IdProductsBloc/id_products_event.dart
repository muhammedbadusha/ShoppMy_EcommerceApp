part of 'id_products_bloc.dart';

@immutable
abstract class IdProductsEvent {}
class getProductIdEvent extends  IdProductsEvent {
   String id;
  getProductIdEvent(this.id);
}