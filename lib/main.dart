import 'package:bloc_learn/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:bloc_learn/data/data_provider/local/local_service.dart';
import 'package:bloc_learn/data/data_provider/remote/app_service.dart';
import 'package:bloc_learn/data/repositories/app_repository.dart';
import 'package:bloc_learn/ui/page/pokemon_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonListBloc>(
          create: (BuildContext context) => PokemonListBloc(repository: AppRepository(appService: AppService(), localService: LocalService()),),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

