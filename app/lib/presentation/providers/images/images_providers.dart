import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/presentation/providers/images/images_repository_provider.dart';

final getPhotosProvider =
    StateNotifierProvider<ImageNotifier, List<String>>((ref) {
  final getPhotos = ref.watch(imageRepositoryProvider).getPhotos;

  return ImageNotifier(getPhotos: getPhotos);
});

typedef ImageCallback = Future<List<String>> Function(String query);

class ImageNotifier extends StateNotifier<List<String>> {
  ImageCallback getPhotos;
  bool isLoading = false;

  ImageNotifier({required this.getPhotos}) : super([]);

  Future<void> loadImages(String query) async {
    if (isLoading) return;

    isLoading = true;
    final photos = await getPhotos(query);

    state = [...photos];

    isLoading = false;
  }
}
