import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/presentation/providers/pais/pais_simplify_providers.dart';
import 'package:proyecto_final/presentation/shared/shareds.dart';
import 'package:proyecto_final/presentation/widgets/pais_tile.dart';

class ContinentScreen extends ConsumerStatefulWidget {
  final String continentName;

  const ContinentScreen({super.key, required this.continentName});

  @override
  ContinentScreenState createState() => ContinentScreenState();
}

class ContinentScreenState extends ConsumerState<ContinentScreen> {
  @override
  void initState() {
    super.initState();
    switch (widget.continentName) {
      case 'África':
        ref.read(getAfricaProvider.notifier).loadContinent();
      case 'América':
        ref.read(getAmericaProvider.notifier).loadContinent();
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    var paises = [];
    switch (widget.continentName) {
      case 'África':
        paises = ref.watch(getAfricaProvider);
      case 'América':
        paises = ref.watch(getAmericaProvider);
    }
    if (paises.isEmpty) return const FullScreenLoader();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          backgroundColor: color,
          title: Text(
            widget.continentName,
            style: const TextStyle(
                fontSize: 34, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: paises.length,
          itemBuilder: (context, index) {
            final pais = paises[index];
            return PaisTile(
              continent: widget.continentName,
              paisSimplify: pais,
              delay: index * 150,
            );
          },
        ));
  }
}
