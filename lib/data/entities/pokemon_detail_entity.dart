import 'package:bloc_learn/data/model/pokemon_detail_model.dart';

class PokemonDetailEntity{
  final String name;
  final List<String> types;
  final Sprites sprites;

  PokemonDetailEntity({required this.name, required this.types, required this.sprites});
}