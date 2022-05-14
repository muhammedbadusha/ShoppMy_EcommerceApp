import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'id_products_event.dart';
part 'id_products_state.dart';

class IdProductsBloc extends Bloc<IdProductsEvent, IdProductsState> {
  IdProductsBloc() : super(IdProductsInitial()) {
    on<IdProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
