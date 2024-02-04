// user_list_event.dart
import 'package:equatable/equatable.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonDetail extends PokemonDetailEvent {
  final String url;

  const GetPokemonDetail({
    required this.url,
  });

  @override
  List<Object> get props => [url];
}