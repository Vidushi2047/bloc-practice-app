// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'value_cubit.dart';

class ValueState extends Equatable {
  final int value1;

  const ValueState({
    required this.value1,
  });
  factory ValueState.initial() {
    return const ValueState(
      value1: 0,
    );
  }

  ValueState copyWith({
    int? value1,
  }) {
    return ValueState(
      value1: value1 ?? this.value1,
    );
  }

  @override
  String toString() => 'valueState(value1: $value1)';

  @override
  List<Object?> get props => [value1];
}
