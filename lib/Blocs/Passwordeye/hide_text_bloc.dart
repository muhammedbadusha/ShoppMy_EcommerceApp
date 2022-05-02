import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'hide_text_event.dart';
part 'hide_text_state.dart';

class HideTextBloc extends Bloc<HideTextEvent, HideTextState> {
  HideTextBloc() : super(Initialvalue()) {

on<Hidetext>((event, emit){

return emit(HideTextState(hidetext: !state.hidetext));
});
  }
}
