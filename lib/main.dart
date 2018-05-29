import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/pages/HomePage.dart';
import 'package:the_movie_db/pages/SplashPage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_movie_db/redux/app_state.dart';
import 'package:the_movie_db/redux/actions/initial_data_actions.dart';
import 'package:the_movie_db/redux/reducers/app_state_reducer.dart';
import 'package:the_movie_db/redux/middlewares/load_initial_data_middleware.dart';

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {
  final reduxStore = Store<AppState>(
    appStateReducer,
    initialState: AppState.loading(),
    middleware: createInitialDataMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: reduxStore,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _createTheme(context),
        home: StoreConnector<AppState, _ViewModel>(
          onInit: (store) => store.dispatch(LoadImagesConfigAction()),
          converter: _ViewModel.fromStore,
          builder: (context, vm) {
            return vm.isConfigLoading ? SplashPage() : HomePage();
          },
        ),
      ),
    );
  }

  ThemeData _createTheme(BuildContext context) {
    return ThemeData(
        primaryColor: Color(0xFF0D1C34),
        backgroundColor: Color(0xFF161D29),
        accentColor: Color(0xFFF9473A),
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(body1: new TextStyle(color: Colors.white)));
  }
}

class _ViewModel {
  final bool isConfigLoading;

  _ViewModel({this.isConfigLoading});

  static _ViewModel fromStore(Store<AppState> store) =>
      _ViewModel(isConfigLoading: store.state.splashLoading);
}
