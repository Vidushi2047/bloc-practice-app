// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dublicate_cubit.dart';

class DublicateState extends Equatable {
  final List<Item> item;

  const DublicateState({required this.item});

  @override
  String toString() => 'DublicateState(item: $item)';

  factory DublicateState.initial() {
    return DublicateState(item: [
      Item(text: 'abc', id: '1', isCompleted: true),
      Item(text: 'bcd', id: '2', isCompleted: false),
      Item(text: 'cde', id: '3', isCompleted: true),
      Item(text: 'def', id: '4', isCompleted: false),
      Item(text: 'efg', id: '5', isCompleted: false),
    ]);
  }

  DublicateState copyWith({
    List<Item>? item,
  }) {
    return DublicateState(
      item: item ?? this.item,
    );
  }

  @override
  List<Object?> get props => [item];
}
