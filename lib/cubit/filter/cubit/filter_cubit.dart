import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.initial());
  void filteredValue(String value) {
    if (state.filterValue == 'all') {
    } else if (state.filterValue == 'not completed') {
    } else {}
  }
}
