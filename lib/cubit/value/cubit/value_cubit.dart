import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'value_state.dart';

class ValueCubit extends Cubit<ValueState> {
  ValueCubit() : super(ValueState.initial());
  void increment() {
    emit(state.copyWith(value1: state.value1 + 1));
  }

  void decrement() {
    emit(state.copyWith(value1: state.value1 - 1));
  }
}
