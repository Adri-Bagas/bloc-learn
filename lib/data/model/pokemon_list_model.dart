class PokemonListResponse {
  int? count;
  String? next;
  String? previous;
  List<Pokemon>? pokemon;

  PokemonListResponse({this.count, this.next, this.previous, this.pokemon});

  PokemonListResponse.fromJson(Map<String, dynamic> json) {

    try{
      count = json['count'];
      next = json['next'];
      previous = json['previous'];
      if(json['results'] == null) pokemon = [];
      if (json['results'] != null) {
        pokemon = <Pokemon>[];
        json['results'].forEach((v) {
          pokemon!.add(new Pokemon.fromJson(v));
        });
      }
    }catch(e){
      throw e;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonList {
  bool? isLastPage;
  List<Pokemon>? pokemons;

  PokemonList({this.isLastPage, this.pokemons});

  PokemonList.fromJson(Map<String, dynamic> json) {
    isLastPage = json['is_last_page'];
    if (json['result'] != null) {
      pokemons = <Pokemon>[];
      json['results'].forEach((v) {
        pokemons!.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_last_page'] = isLastPage;
    if (this.pokemons != null) {
      data['pokemon'] = this.pokemons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String? name;
  String? url;
  String? image;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    image = "https://img.pokemondb.net/sprites/sword-shield/icon/${json['name']}.png";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
