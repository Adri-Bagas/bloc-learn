// user_list_state.dart
import 'package:bloc_learn/data/model/pokemon_list_model.dart';
import 'package:equatable/equatable.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => [];
}

class PokemonListEmpty extends PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListLoaded extends PokemonListState {
  final PokemonList data;
  final int nextPageKey;

  const PokemonListLoaded({
    required this.data,
    required this.nextPageKey,
  });

  @override
  List<Object> get props => [data, nextPageKey];
}

class PokemonListLastPageLoaded extends PokemonListState {
  final PokemonList data;

  const PokemonListLastPageLoaded({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class PokemonListError extends PokemonListState {
  final String message;
  final int code;

  const PokemonListError({
    required this.message,
    required this.code
  });

  @override
  List<Object> get props => [message, code];
}