import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/pages/SplashPage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_movie_db/redux/app_state.dart';
import 'package:the_movie_db/redux/actions/initial_data_actions.dart';
import 'package:the_movie_db/redux/reducers/app_state_reducer.dart';
import 'package:the_movie_db/redux/middlewares/load_initial_data_middleware.dart';

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
      appStateReducer,
      initialState: AppState.loading(),
      middleware: createInitialDataMiddleware(),
    );

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'TheMovieDB',
        theme: ThemeData(
          primaryColor: Color(0xFF0D1C34),
          backgroundColor: Color(0xFF161D29),
          accentColor: Color(0xFFF9473A),
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(body1: new TextStyle(color: Colors.white)),
        ),
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(LoadImagesConfigAction()),
          builder: (context, store) {
            return SplashPage();
          },
        ),
      ),
    );
  }
}
