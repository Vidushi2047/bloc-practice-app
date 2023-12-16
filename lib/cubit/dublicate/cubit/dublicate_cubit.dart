import 'package:bloc/bloc.dart';
import 'package:bloc_communication/model/ItemModel.dart';
import 'package:equatable/equatable.dart';
part 'dublicate_state.dart';

class DublicateCubit extends Cubit<DublicateState> {
  DublicateCubit() : super(DublicateState.initial());
  void toggle(index) {
    print('toggle');
    final updatedItems = [...state.item];
    updatedItems[index] =
        state.item[index].copyWith(isCompleted: !state.item[index].isCompleted);
    final newlist = state.copyWith(item: updatedItems);
    print("updated item-$updatedItems");
    emit(newlist);
  }

  void edit(int index, String newText) {
    print('toggle');
    final updatedItems = [...state.item];
    updatedItems[index] = Item(text: newText);
    final newlist = state.copyWith(item: updatedItems);
    print("updated item-$updatedItems");
    emit(newlist);
  }

  // void toggle(index) {
  //   print('toggle');
  //   final updatedItems = [...state.item]; // List<Item>.from(state.item);
  //   updatedItems[index] = state.item[index] = Item(
  //       text: state.item[index].text,
  //       id: state.item[index].id,
  //       isCompleted: !state.item[index].isCompleted);
  //   print(state.item[index]);
  //   final newlist = state.copyWith(item: updatedItems);
  //   emit(newlist);
  //   print("updated item-$updatedItems");
  // }
}
