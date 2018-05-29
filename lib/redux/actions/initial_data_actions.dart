import 'package:the_movie_db/model/ImagesConfig.dart';

class LoadImagesConfigAction {}

class ImagesConfigLoadedAction {
  final ImagesConfig imagesConfig;

  ImagesConfigLoadedAction(this.imagesConfig);
}

class ImagesConfigNotLoadedAction {
  final dynamic error;

  ImagesConfigNotLoadedAction(this.error);
}
