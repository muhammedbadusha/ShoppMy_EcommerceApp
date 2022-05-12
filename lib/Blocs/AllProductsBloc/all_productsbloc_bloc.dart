import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orgfirstproject/ApiCalls/ProductApi.dart';
import 'package:orgfirstproject/ModelClasses/AllProductsModel.dart';

part 'all_productsbloc_event.dart';
part 'all_productsbloc_state.dart';

class AllProductsblocBloc extends Bloc<AllProductsblocEvent, AllProductsblocState> {
 late AllProductsModel allProductsModel;
  ProductApi productApi;
  AllProductsblocBloc(this.productApi) : super(AllProductsblocInitial()) {
    on<getAllProductsEvent>((event, emit) async{
      emit(AllProductsblcLoading());
      try{
        allProductsModel=await productApi.allProductsFuction();
        emit(AllProductsblocLoaded());
      }
      catch(error){
        print(error);
        emit(AllProductsblocInitial());
      }
      // TODO: implement event handler
    });
  }
}
