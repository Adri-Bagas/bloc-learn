import 'package:flutter/material.dart';

class PokemonTypeColorIcons {
  final Map<String, dynamic> typeColors = {
    'normal': Colors.grey,
    'fire': Colors.red,
    'water': Colors.blue,
    'electric': Colors.yellow,
    'grass': Colors.green,
    'ice': Colors.cyan,
    'fighting': Colors.orange,
    'poison': Colors.purple,
    'ground': Colors.brown,
    'flying': Colors.indigo,
    'psychic': Colors.pink,
    'bug': Colors.lime,
    'rock': Colors.amber,
    'ghost': Colors.deepPurple,
    'dragon': Colors.indigo,
    'dark': Colors.brown,
    'steel': Colors.grey,
    'fairy': Colors.pink,
  };

  final Map<String, IconData> typeIcons = {
    'normal': Icons.star,
    'fire': Icons.whatshot,
    'water': Icons.opacity,
    'electric': Icons.flash_on,
    'grass': Icons.eco,
    'ice': Icons.ac_unit,
    'fighting': Icons.fitness_center,
    'poison': Icons.opacity,
    'ground': Icons.gps_fixed,
    'flying': Icons.flight,
    'psychic': Icons.outlet_rounded,
    'bug': Icons.bug_report,
    'rock': Icons.terrain,
    'ghost': Icons.gradient_rounded,
    'dragon': Icons.king_bed_outlined,
    'dark': Icons.brightness_3,
    'steel': Icons.build,
    'fairy': Icons.favorite,
  };

  Color calculateTextColor(MaterialColor backgroundColor) {
    const threshold = 128;
    int averageColor = (backgroundColor[500]!.red +
        backgroundColor[500]!.green +
        backgroundColor[500]!.blue) ~/
        3;

    return averageColor > threshold ? backgroundColor.shade900 : backgroundColor.shade50;
  }
}