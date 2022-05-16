import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orgfirstproject/ApiCalls/ProductApi.dart';
import 'package:orgfirstproject/ModelClasses/AllProductModel.dart';
import 'package:orgfirstproject/ModelClasses/ProductIdModel.dart';

part 'id_products_event.dart';
part 'id_products_state.dart';

class IdProductsBloc extends Bloc<IdProductsEvent, IdProductsState> {
  late List<ProductIdModel> productIdModel;
  ProductApi productApi;
  IdProductsBloc(this.productApi) : super(IdProductsInitial()) {
    on<getProductIdEvent>((event, emit) async{
      emit(ProductIdLoading());
      try{
        productIdModel=await productApi.idProductFunction(event.id);
        emit(ProductIdLoaded());
      }
      catch(error){
        emit(ProductIdError());
      }
      // TODO: implement event handler
    });
  }
}
