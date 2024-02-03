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

// Al usar el AutomaticKeepAliveClientMixin, lo que podemos hacer es mantener el 'estado' de la pantalla, es decir
// que si hacemos scroll, navegamos a otra, y volvemos, el scroll queda donde estaba.

class ContinentScreenState extends ConsumerState<ContinentScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    switch (widget.continentName) {
      case 'America':
        ref.read(getAmericaProvider.notifier).loadContinent();
      case 'Africa':
        ref.read(getAfricaProvider.notifier).loadContinent();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final color = Theme.of(context).primaryColor;
    var paises = [];
    switch (widget.continentName) {
      case 'America':
        paises = ref.watch(getAmericaProvider);
      case 'Africa':
        paises = ref.watch(getAfricaProvider);
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
                continent: widget.continentName, paisSimplify: pais);
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
