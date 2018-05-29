import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_db/pages/HomePage.dart';
import 'package:the_movie_db/redux/app_state.dart';
import 'package:the_movie_db/widgets/AppSpinnerWidget.dart';

class SplashPageBodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        if (vm.isLoading) {
          return new Container(
            child: Center(child: AppSpinnerWidget()),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/loading_screen.jpg'),
              ),
            ),
          );
        } else {
          return Text('DONE');
//          Navigator.pushAndRemoveUntil(
//              context,
//              MaterialPageRoute(builder: (context) => HomePage()),
//              (route) => false);
        }
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;

  _ViewModel({this.isLoading});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(isLoading: store.state.splashLoading);
  }
}
