import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/ItemModel.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemState.initial());

  void add(String text) {
    var newItem = Item(text: text);
    print('newItem-$newItem');
    emit(state.copyWith(itemList: [...state.itemList, newItem]));
  }

  void delete(String id) {
    var newList = state.itemList.where((Item item) => item.id != id).toList();
    //  state.itemList.removeWhere((element) => element.id == id);
    emit(state.copyWith(itemList: newList));
  }

  String countActiveItem() {
    return state.itemList
        .where((Item item) => item.isCompleted == true)
        .toList()
        .length
        .toString();
  }

  void toggle(index) {
    print('toggle');
    final updatedItems = [...state.itemList];
    updatedItems[index] = updatedItems[index].copyWith(
      isCompleted: !updatedItems[index].isCompleted,
    );
    final newlist = state.copyWith(itemList: updatedItems);
    print("updated item-$updatedItems");
    emit(newlist);
  }

  void edit(index, String newText) {
    print('edit');
    final updatedItems = [...state.itemList];
    updatedItems[index] = updatedItems[index].copyWith(text: newText);

    print("updated item-$updatedItems");
    emit(state.copyWith(itemList: updatedItems));
  }
}
