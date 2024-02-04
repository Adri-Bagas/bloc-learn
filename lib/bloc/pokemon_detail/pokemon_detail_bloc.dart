import 'package:bloc_learn/bloc/pokemon_detail/pokemon_detail_event.dart';
import 'package:bloc_learn/bloc/pokemon_detail/pokemon_detail_state.dart';
import 'package:bloc_learn/data/repositories/app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final AppRepository appRepository;

  PokemonDetailBloc({
    required this.appRepository,
  }) : super(PokemonDetailLoading()) {
    on<GetPokemonDetail>((event, emit) async {
        try{
          emit(PokemonDetailLoading());

          EasyLoading.show();

          final data = await appRepository.getContentPokemonDetail(event.url);

          EasyLoading.dismiss();

          emit(PokemonDetailLoaded(data: data));

        }on Exception catch (e, stackTrace) {
          debugPrint(stackTrace.toString());
          emit(PokemonDetailError(code: 100, message: e.toString()));
        } catch (e, stackTrace) {
          debugPrint(stackTrace.toString());
        }
      },
    );
  }
}