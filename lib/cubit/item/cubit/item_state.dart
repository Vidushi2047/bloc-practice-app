// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'item_cubit.dart';

class ItemState extends Equatable {
  List<Item> itemList;
  ItemState({required this.itemList});

  factory ItemState.initial() {
    return ItemState(itemList: const [
      // Item(id: "1", text: 'clean room', isCompleted: true),
      // Item(id: "2", text: 'do exercise', isCompleted: false)
    ]);
  }
  ItemState copyWith({
    List<Item>? itemList,
  }) {
    return ItemState(
      itemList: itemList ?? this.itemList,
    );
  }

  @override
  String toString() => 'ItemState(itemList: $itemList)';

  @override
  List<Object?> get props => [itemList];
}
