import 'package:bloc/bloc.dart';

part 'operation_state.dart';

class OperationCubit extends Cubit<OperationState> {
  OperationCubit() : super(OperationState.initial());
  void result(int value) {
    print('result');
    if (value % 2 == 0) {
      emit(state.copyWith(operation: 'Even'));
    } else if (value % 2 != 0) {
      emit(state.copyWith(operation: 'Odd'));
    } else {
      emit(state.copyWith(operation: "don't know"));
    }
  }
}
