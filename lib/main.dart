import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onboarding/redux/app_reducer.dart';
import 'package:onboarding/redux/app_state.dart';
import 'package:onboarding/redux/middleware.dart';
import 'package:onboarding/screens/home_screen_view.dart';
import 'package:onboarding/widgets/constants.dart';
import 'package:onboarding/widgets/newColors.dart';
import 'package:redux/redux.dart';

final _appStore = Store<AppState>(updateMoviesListReducer,
    initialState: AppState.initialState(),
    middleware: [fetchMovieListMiddleware]);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _appStore,
      child: MaterialApp(
        title: 'onboarding',
        theme: ThemeData(
          primaryColor: PaySmartColors.darkBlue,
          accentColor: PaySmartColors.lightBlue,
          secondaryHeaderColor: PaySmartColors.lightGreen,
          errorColor: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontSize: titleTextSize, fontWeight: FontWeight.bold),
                ),
          ),
        ),
        home: HomeScreenView(
          title: titleText,
        ),
      ),
    );
  }
}
