import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'count_item_state.dart';

class CountItemCubit extends Cubit<CountItemState> {
  CountItemCubit() : super(CountItemState.initial());
  void itemlength(int length) {
    print(length);
    emit(state.copyWith(countItems: length));
  }
}
