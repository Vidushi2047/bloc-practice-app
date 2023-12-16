// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'operation_cubit.dart';

class OperationState {
  final String operation;

  OperationState({required this.operation});

  factory OperationState.initial() {
    return OperationState(operation: '');
  }
  @override
  String toString() => 'OperationState(operation: $operation)';

  OperationState copyWith({
    String? operation,
  }) {
    return OperationState(
      operation: operation ?? this.operation,
    );
  }
}
