import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/domain/entities/pais/pais.dart';
import 'package:proyecto_final/presentation/providers/pais/pais_repository_provider.dart';

final nameSelectedProvider = StateProvider((ref) => '');
final codeSelectedProvider = StateProvider((ref) => '');
final continentSelectedProvider = StateProvider((ref) => '');

final getPaisByIDProvider =
    StateNotifierProvider<PaisNotifier, Map<String, Pais>>((ref) {
  final getPais = ref.watch(paisRepositoryProvider).getPais;

  return PaisNotifier(getPais: getPais);
});

typedef PaisCallback = Future<Pais> Function(
    String paisID, String continent, String code);

class PaisNotifier extends StateNotifier<Map<String, Pais>> {
  PaisCallback getPais;

  PaisNotifier({required this.getPais}) : super({});

  Future<void> loadPais(String paisID, String continent, String code) async {
    if (state[paisID] != null) return;
    final pais = await getPais(paisID, continent, code);

    // Vamos cargando los países en un Map<String, Pais> para que si se vuelve a acceder a uno ya cargado,
    // no se vuelva a hacer la solicitud.
    state = {...state, paisID: pais};
  }
}
