// user_list_event.dart
import 'package:equatable/equatable.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonList extends PokemonListEvent {
  final int pageKey;

  const GetPokemonList({
    required this.pageKey,
  });

  @override
  List<Object> get props => [pageKey];
}