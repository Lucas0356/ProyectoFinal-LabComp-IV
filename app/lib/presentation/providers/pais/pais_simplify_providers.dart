import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/domain/entities/pais/pais_simplify.dart';
import 'package:proyecto_final/presentation/providers/pais/pais_repository_provider.dart';

final getAfricaProvider =
    StateNotifierProvider<PaisSimplifyNotifier, List<PaisSimplify>>((ref) {
  final getContinent = ref.watch(paisRepositoryProvider).getAfrica;

  return PaisSimplifyNotifier(getContinent: getContinent);
});

final getAmericaProvider =
    StateNotifierProvider<PaisSimplifyNotifier, List<PaisSimplify>>((ref) {
  final getContinent = ref.watch(paisRepositoryProvider).getAmerica;

  return PaisSimplifyNotifier(getContinent: getContinent);
});

typedef PaisSimplifyCallback = Future<List<PaisSimplify>> Function();

class PaisSimplifyNotifier extends StateNotifier<List<PaisSimplify>> {
  bool isLoading = false;
  PaisSimplifyCallback getContinent;

  PaisSimplifyNotifier({required this.getContinent}) : super([]);

  Future<void> loadContinent() async {
    if (isLoading) return;

    isLoading = true;
    final List<PaisSimplify> paises = await getContinent();

    state = [...paises];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
