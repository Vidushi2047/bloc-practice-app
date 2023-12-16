// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Item extends Equatable {
  final String id;
  final String text;
  final bool isCompleted;
  Item({String? id, required this.text, this.isCompleted = false})
      : id = id ?? uuid.v4();

  Item copyWith({
    String? id,
    String? text,
    bool? isCompleted,
  }) {
    return Item(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() => 'Item(id: $id, text: $text, isCompleted: $isCompleted)';

  @override
  List<Object?> get props => [id, text, isCompleted];
}
