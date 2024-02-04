//app_repository.dart
import 'package:bloc_learn/data/data_provider/local/local_service.dart';
import 'package:bloc_learn/data/data_provider/remote/app_service.dart';
import 'package:bloc_learn/data/entities/pokemon_detail_entity.dart';
import 'package:bloc_learn/data/model/pokemon_detail_model.dart';
import 'package:bloc_learn/data/model/pokemon_list_model.dart';

class AppRepository {
  final AppService appService;
  final LocalService localService;

  AppRepository({
    required this.appService,
    required this.localService,
  });

  Future<PokemonList> getContentPokemonList(int page, bool isProcess, int limit) async {
    PokemonListResponse response = await appService.fetchPokemonList(page, limit);
    return PokemonList(
      isLastPage: response.count! < limit,
      pokemons: response.pokemon!.map((data) => Pokemon(
        name: data.name,
        url: data.url,
        image: "https://img.pokemondb.net/sprites/sword-shield/icon/${data.name}.png",
      )).toList(),
    );
  }

  Future<PokemonDetailEntity> getContentPokemonDetail(String url) async {
    PokemonDetail response = await appService.fetchPokemonDetail(url);

    List<String> typeDatas = response.types!.map((e) => e.type!.name!).toList();

    return PokemonDetailEntity(name: response.name!, types: typeDatas, sprites: response.sprites!);
  }

}