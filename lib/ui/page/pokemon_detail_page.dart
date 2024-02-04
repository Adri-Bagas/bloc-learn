import 'package:bloc_learn/bloc/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:bloc_learn/bloc/pokemon_detail/pokemon_detail_event.dart';
import 'package:bloc_learn/bloc/pokemon_detail/pokemon_detail_state.dart';
import 'package:bloc_learn/data/entities/pokemon_detail_entity.dart';
import 'package:bloc_learn/data/model/pokemon_detail_model.dart' as det;
import 'package:bloc_learn/data/utils_classes/pokemon_type_color_icon_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {

  final String url;

  const MainPage({super.key, required this.url});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final PokemonTypeColorIcons _pokemonTypeColor = PokemonTypeColorIcons();

  String capitalize(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }

  final PokemonDetailEntity _pokemonDetailEntity = PokemonDetailEntity(name: "", types: ["normal"], sprites: det.Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png"));

  void _loadPokemonDetail(BuildContext context, url) => context.read<PokemonDetailBloc>().add(GetPokemonDetail(url: url));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadPokemonDetail(context, widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNav(),
      body: _appBody(context),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: null,
      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
      style: ButtonStyle(
        backgroundColor:
        MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
    ),
    title: Image.asset("images/pokemon_logo.png", height: 40),
    centerTitle: true,
    actions: [
      Container(
        margin: const EdgeInsets.only(
          right: 20,
        ),
        child: const Icon(
          Icons.catching_pokemon,
          color: Colors.white,
        ),
      ),
    ],
  );

  Widget _bottomNav() => BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.grain_rounded), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.pages_outlined), label: "Pokemon"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded), label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
    ],
    currentIndex: 1,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey.shade700,
  );

  // Widget _appBody(BuildContext context) => Builder(
  //   builder: (context) {
  //     return BlocListener<PokemonDetailBloc, PokemonDetailState>(
  //       listener: (_, state){
  //         if(state is PokemonDetailLoaded) {
  //
  //           // _pokemonDetailEntity = state.data;
  //
  //         }else if (state is PokemonDetailInitial) {
  //         }else if (state is PokemonDetailLoading){
  //         }else if (state is PokemonDetailError){
  //           debugPrint(state.message);
  //         }
  //       },
  //       child: Container(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             colors: [
  //               _pokemonTypeColor.typeColors[_pokemonDetailEntity.types[0]],
  //               _pokemonTypeColor.typeColors[_pokemonDetailEntity.types[0]].shade300,
  //             ],
  //             begin: AlignmentDirectional.topCenter,
  //             end: AlignmentDirectional.bottomCenter,
  //           ),
  //         ),
  //         child: SafeArea(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 child: Column(
  //                   children: [
  //                     const SizedBox(
  //                       height: 48,
  //                     ),
  //                     Text(
  //                       capitalize(_pokemonDetailEntity.name),
  //                       style: GoogleFonts.rubik(
  //                         color: _pokemonTypeColor.calculateTextColor(_pokemonTypeColor.typeColors[_pokemonDetailEntity.types[0]]),
  //                         fontWeight: FontWeight.w800,
  //                         fontSize: 56,
  //                       ),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //
  //                         ..._pokemonDetailEntity.types.map((e) => Row(
  //                           children: [
  //                             const SizedBox(
  //                               width: 8,
  //                             ),
  //                             Icon(_pokemonTypeColor.typeIcons[e], color: _pokemonTypeColor.typeColors[e].shade900, size: 16),
  //                             const SizedBox(
  //                               width: 4,
  //                             ),
  //                             Text(
  //                               e,
  //                               style: GoogleFonts.rubik(
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.w600,
  //                                 fontSize: 14,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 40,
  //               ),
  //               Image.network(
  //                 _pokemonDetailEntity.sprites.frontDefault!,
  //                 fit: BoxFit.cover,
  //                 height: MediaQuery.of(context).size.width * 0.92,
  //                 width: MediaQuery.of(context).size.width * 0.92,
  //                 filterQuality: FilterQuality.none,
  //               ),
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.92,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     GestureDetector(
  //                       onTap: (){
  //
  //                       },
  //                       child: Container(
  //                         alignment: Alignment.center,
  //                         height: 52,
  //                         width: 136,
  //                         decoration: BoxDecoration(
  //                           color: Colors.black,
  //                           borderRadius: BorderRadius.circular(12),
  //                         ),
  //                         child: Text(
  //                           "About",
  //                           style: GoogleFonts.rubik(
  //                             color: Colors.white,
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Stack(
  //                       alignment: AlignmentDirectional.center,
  //                       children: [
  //                         Container(
  //                           padding: EdgeInsets.symmetric(
  //                             horizontal: 18,
  //                             vertical: 18,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             color: Colors.yellow.shade100.withOpacity(0.2),
  //                             borderRadius: BorderRadius.circular(18),
  //                           ),
  //                           child: Icon(Icons.add, color: Colors.black),
  //                         ),
  //                         Container(
  //                           padding: EdgeInsets.symmetric(
  //                             horizontal: 12,
  //                             vertical: 12,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             color: Colors.yellow,
  //                             borderRadius: BorderRadius.circular(18),
  //                           ),
  //                           child: Icon(Icons.add, color: Colors.black),
  //                         ),
  //                       ],
  //                     ),
  //                     Container(
  //                       alignment: Alignment.center,
  //                       height: 52,
  //                       width: 136,
  //                       decoration: BoxDecoration(
  //                         color: Colors.red.shade100,
  //                         borderRadius: BorderRadius.circular(12),
  //                       ),
  //                       child: Text(
  //                         "Evolution",
  //                         style: GoogleFonts.rubik(
  //                           color: Colors.red,
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // );

  Widget _appBody(BuildContext context) => Builder(
      builder: (context) {
        return BlocBuilder(
          builder: (_, state){
            if(state is PokemonDetailLoaded) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _pokemonTypeColor.typeColors[state.data.types[0]],
                      _pokemonTypeColor.typeColors[state.data.types[0]].shade300,
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 48,
                            ),
                            Text(
                              capitalize(state.data.name),
                              style: GoogleFonts.rubik(
                                color: _pokemonTypeColor.calculateTextColor(_pokemonTypeColor.typeColors[state.data.types[0]]),
                                fontWeight: FontWeight.w800,
                                fontSize: 56,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                ...state.data.types.map((e) => Row(
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(_pokemonTypeColor.typeIcons[e], color: _pokemonTypeColor.typeColors[e].shade900, size: 16),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      e,
                                      style: GoogleFonts.rubik(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.network(
                        state.data.sprites.frontDefault!,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.width * 0.92,
                        width: MediaQuery.of(context).size.width * 0.92,
                        filterQuality: FilterQuality.none,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 52,
                                width: 136,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "About",
                                  style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 18,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade100.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 52,
                              width: 136,
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Evolution",
                                style: GoogleFonts.rubik(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _pokemonTypeColor.typeColors[_pokemonDetailEntity.types[0]],
                      _pokemonTypeColor.typeColors[_pokemonDetailEntity.types[0]].shade300,
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 48,
                            ),
                            Text(
                              capitalize(_pokemonDetailEntity.name),
                              style: GoogleFonts.rubik(
                                color: _pokemonTypeColor.calculateTextColor(_pokemonTypeColor.typeColors[_pokemonDetailEntity.types[0]]),
                                fontWeight: FontWeight.w800,
                                fontSize: 56,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                ..._pokemonDetailEntity.types.map((e) => Row(
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(_pokemonTypeColor.typeIcons[e], color: _pokemonTypeColor.typeColors[e].shade900, size: 16),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      e,
                                      style: GoogleFonts.rubik(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.network(
                        _pokemonDetailEntity.sprites.frontDefault!,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.width * 0.92,
                        width: MediaQuery.of(context).size.width * 0.92,
                        filterQuality: FilterQuality.none,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.92,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 52,
                                width: 136,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "About",
                                  style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 18,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade100.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(Icons.add, color: Colors.black),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 52,
                              width: 136,
                              decoration: BoxDecoration(
                                color: Colors.red.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Evolution",
                                style: GoogleFonts.rubik(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
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
          },
        );
      }
  );
}