//home_page.dart
import 'package:bloc_learn/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:bloc_learn/bloc/pokemon_list/pokemon_list_event.dart';
import 'package:bloc_learn/bloc/pokemon_list/pokemon_list_state.dart';
import 'package:bloc_learn/data/model/pokemon_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PagingController<int, Pokemon> _pagingUserController = PagingController(firstPageKey: 0);

  void _setListPaging() {
    _pagingUserController.addPageRequestListener((pageKey) {
      _loadUserList(pageKey);
    });
  }

  void _loadUserList(int pageKey) => context.read<PokemonListBloc>().add(GetPokemonList(pageKey: pageKey));

  @override
  void initState() {
    _setListPaging();
    super.initState();
  }

  @override
  void dispose() {
    _pagingUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Colors.white,
        body: _appBody(),
      );

  Widget _appBody() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: BlocListener<PokemonListBloc, PokemonListState>(
        listener: (context, state) {
          if (state is PokemonListLastPageLoaded) {
            _pagingUserController.appendLastPage(state.data.pokemons!);
          } else if (state is PokemonListLoaded) {
            _pagingUserController.appendPage(state.data.pokemons!, state.nextPageKey);
          } else if (state is PokemonListError) {
            _pagingUserController.error = state.message;
          }
        },
        child: RefreshIndicator(
          onRefresh: () => Future.sync(
                () => _pagingUserController.refresh(),
          ),
          child: Builder(
              builder: (context) {
                return PagedListView<int, Pokemon>(
                  pagingController: _pagingUserController,
                  builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                    itemBuilder: (context, item, index) => _pokemonListItem(context, item),
                    firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                    newPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
                    noItemsFoundIndicatorBuilder: (_) => const Center(
                        child: Text(
                          "No Data wwwwwwww",
                        ),
                    ),
                  ),
                );
              }
          ),
        )),
  );

  Widget _pokemonListItem(BuildContext context, Pokemon item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Image.network(
              "${item.image}",
              errorBuilder: (context, error, stackTrace) => Image.network(
                "https://img.pokemondb.net/sprites/scarlet-violet/icon/${item.name}.png",
                errorBuilder: (context, error, stackTrace) => Image.network(
                  "https://img.pokemondb.net/sprites/sword-shield/icon/ditto.png",
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}