import 'package:bloc_learn/data/model/pokemon_detail_model.dart';
import 'package:bloc_learn/data/model/pokemon_list_model.dart';
import 'package:dio/dio.dart';

class AppService {

  final Dio _dio = Dio();

  final String baseUrl = "https://pokeapi.co/api/v2/pokemon";

  Future<PokemonListResponse> fetchPokemonList(int page, int limit) async {
    final response =  await _dio.get("$baseUrl?offset=$page&limit=$limit");

    if (response.statusCode != 200) {
      throw Exception(response.data['errorMessage']);
    }

    return PokemonListResponse.fromJson(response.data);
  }

  Future<PokemonDetail> fetchPokemonDetail(String url) async {
    final response =  await _dio.get(url);

    if (response.statusCode != 200) {
      throw Exception(response.data['errorMessage']);
    }

    return PokemonDetail.fromJson(response.data);
  }
}