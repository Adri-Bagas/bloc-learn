// user_list_state.dart
import 'package:bloc_learn/data/entities/pokemon_detail_entity.dart';
import 'package:bloc_learn/data/model/pokemon_list_model.dart';
import 'package:equatable/equatable.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object> get props => [];
}

class PokemonDetailEmpty extends PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailLoaded extends PokemonDetailState {
  final PokemonDetailEntity data;

  const PokemonDetailLoaded({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class PokemonDetailError extends PokemonDetailState {
  final String message;
  final int code;

  const PokemonDetailError({required this.message, required this.code});

  @override
  List<Object> get props => [message, code];
}
