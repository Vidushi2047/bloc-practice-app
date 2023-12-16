import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'word_state.dart';

class WordCubit extends Cubit<WordState> {
  WordCubit() : super(WordState.initial());
  void ShowWord(int value) {
    switch (value) {
      case 1:
        emit(state.copyWith(word: "One"));
        break;
      case 2:
        emit(state.copyWith(word: "Two"));
        break;
      case 3:
        emit(state.copyWith(word: "Three"));
        break;
      case 4:
        emit(state.copyWith(word: "Four"));
        break;
      case 5:
        emit(state.copyWith(word: "Five"));
        break;
      case 6:
        emit(state.copyWith(word: "Six"));
        break;
      case 7:
        emit(state.copyWith(word: "Seven"));
        break;
      case 8:
        emit(state.copyWith(word: "Eight"));
        break;
      case 9:
        emit(state.copyWith(word: "nine"));
        break;
      default:
        emit(state.copyWith(
            word: "Given Number is greater than 9 or less than 1"));
    }
  }
}
