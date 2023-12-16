// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_cubit.dart';

class FilterState extends Equatable {
  final String filterValue;

  FilterState({required this.filterValue});
  factory FilterState.initial() {
    return FilterState(filterValue: 'all');
  }

  FilterState copyWith({
    String? filterValue,
  }) {
    return FilterState(
      filterValue: filterValue ?? this.filterValue,
    );
  }

  @override
  String toString() => 'FilterState(filterValue: $filterValue)';

  @override
  List<Object?> get props => [];
}
