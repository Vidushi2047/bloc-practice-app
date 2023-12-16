// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'count_item_cubit.dart';

class CountItemState extends Equatable {
  final int countItems;

  CountItemState({required this.countItems});
  factory CountItemState.initial() {
    return CountItemState(countItems: 0);
  }

  CountItemState copyWith({
    int? countItems,
  }) {
    return CountItemState(
      countItems: countItems ?? this.countItems,
    );
  }

  @override
  String toString() => 'CountItemState(countItems: $countItems)';

  @override
  List<Object?> get props => [countItems];
}
