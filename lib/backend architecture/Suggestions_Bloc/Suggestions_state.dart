part of 'Suggestions_bloc.dart';

abstract class SuggestionsState extends Equatable {
  List<Object> get props => [];
}

class SuggestionsReady extends SuggestionsState {
  List<String?> suggestions;
  SuggestionsReady({required this.suggestions});
  @override
  List<Object> get props => [suggestions];
}

class SuggestionsInitial extends SuggestionsState {}
