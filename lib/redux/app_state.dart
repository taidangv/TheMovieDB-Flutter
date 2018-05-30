import 'package:meta/meta.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';

@immutable
class AppState {
  final bool initialDataDownloading;
  final ImagesConfig imagesConfig;

  AppState({
    this.initialDataDownloading = false,
    this.imagesConfig,
  });

  AppState copyWith({
    bool splashLoading,
    ImagesConfig imagesConfig,
  }) {
    return AppState(
      initialDataDownloading: splashLoading ?? this.initialDataDownloading,
      imagesConfig: imagesConfig ?? this.imagesConfig,
    );
  }

  factory AppState.loading() => AppState(initialDataDownloading: true);
}
