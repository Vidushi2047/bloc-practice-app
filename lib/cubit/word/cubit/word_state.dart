// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'word_cubit.dart';

class WordState extends Equatable {
  final String word;

  const WordState({required this.word});
  factory WordState.initial() {
    return const WordState(word: '');
  }

  @override
  List<Object> get props => [word];

  WordState copyWith({
    String? word,
  }) {
    return WordState(
      word: word ?? this.word,
    );
  }

  @override
  bool get stringify => true;
}
