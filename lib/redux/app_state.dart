import 'package:meta/meta.dart';
import 'package:the_movie_db/model/ImagesConfig.dart';

@immutable
class AppState {
  final bool splashLoading;
  final ImagesConfig imagesConfig;

  AppState({
    this.splashLoading = false,
    this.imagesConfig,
  });

  AppState copyWith({
    bool splashLoading,
    ImagesConfig imagesConfig,
  }) {
    return AppState(
      splashLoading: splashLoading ?? this.splashLoading,
      imagesConfig: imagesConfig ?? this.imagesConfig,
    );
  }

  factory AppState.loading() => AppState(splashLoading: true);
}
