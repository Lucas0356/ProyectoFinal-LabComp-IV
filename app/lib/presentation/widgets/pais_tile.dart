import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/domain/entities/pais/pais_simplify.dart';
import 'package:proyecto_final/presentation/providers/pais/pais_providers.dart';

class PaisTile extends ConsumerWidget {
  final PaisSimplify paisSimplify;
  final String continent;

  const PaisTile(
      {Key? key, required this.paisSimplify, required this.continent})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: colors.primary,
          height: 90,
          width: 200,
          child: ListTile(
            title: Text(
              paisSimplify.name, // Acceder a la propiedad correcta
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            subtitle: Text(paisSimplify.capital,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white54)),
            leading: Text(
              paisSimplify.flag,
              style: const TextStyle(fontSize: 35),
            ),
            minLeadingWidth: 40,
            onTap: () {
              ref.read(nameSelectedProvider.notifier).state = paisSimplify.name;
              ref.read(continentSelectedProvider.notifier).state = continent;
              context.push('/registro/${paisSimplify.id}');
            },
          ),
        ),
      ),
    );
  }
}
