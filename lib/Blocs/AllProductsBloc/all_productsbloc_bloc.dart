import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orgfirstproject/ApiCalls/ProductApi.dart';
import 'package:orgfirstproject/ModelClasses/AllProductModel.dart';


part 'all_productsbloc_event.dart';
part 'all_productsbloc_state.dart';

class AllProductsblocBloc extends Bloc<AllProductsblocEvent, AllProductsblocState> {
 late List<AllProductModel> allProductModel;
  ProductApi productApi;
  AllProductsblocBloc(this.productApi) : super(AllProductsblocInitial()) {
    on<getAllProductsEvent>((event, emit) async{
      emit(AllProductsblcLoading());
      try{
        allProductModel=await productApi.allProductFunction();
        emit(AllProductsblocLoaded());
      }
      catch(error){
        print('catch error $error');
        emit(AllProductsblocError());
      }
      // TODO: implement event handler
    });
  }
}
