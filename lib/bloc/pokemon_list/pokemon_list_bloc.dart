// user_list_bloc.dart
import 'package:bloc_learn/bloc/pokemon_list/pokemon_list_event.dart';
import 'package:bloc_learn/bloc/pokemon_list/pokemon_list_state.dart';
import 'package:bloc_learn/data/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final AppRepository repository;

  static const int _pageLimit = 20;

  PokemonListBloc({
    required this.repository,
  }) : super(PokemonListLoading()) {

    on<GetPokemonList>((event, emit) async {
      try {
        //await Future.delayed(const Duration(seconds: 5));
        emit(PokemonListLoading());
        final data = await repository.getContentPokemonList(
          event.pageKey,
          false,
          _pageLimit,
        );
        final isLastPage = data.isLastPage;
        if (isLastPage!) {
          emit(PokemonListLastPageLoaded(data: data));
        } else {
          final nextPageKey = event.pageKey + 20;
          emit(PokemonListLoaded(data: data, nextPageKey: nextPageKey));
        }
      } on Exception catch (e, stackTrace) {
        debugPrint(stackTrace.toString());
        emit(PokemonListError(code: 100, message: e.toString()));
      } catch (e, stackTrace) {
        debugPrint(stackTrace.toString());
      }
    });
  }
}