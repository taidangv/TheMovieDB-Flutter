import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/presentation/pages/HomePage.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_movie_db/presentation/widgets/AppSpinnerWidget.dart';
import 'package:the_movie_db/redux/actions/initial_data_actions.dart';

class AppLoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (store) => store.dispatch(LoadImagesConfigAction()),
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return vm.initialDataDownloading
            ? _spinnerWithBackground()
            : HomePage();
      },
    );
  }
}

Widget _spinnerWithBackground() {
  return Container(
    child: Center(child: AppSpinnerWidget()),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/loading_screen.jpg'),
      ),
    ),
  );
}

class _ViewModel {
  final bool initialDataDownloading;

  _ViewModel(this.initialDataDownloading);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(store.state.imagesConfig == null);
  }
}
