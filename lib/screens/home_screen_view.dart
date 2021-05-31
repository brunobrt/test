import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onboarding/redux/app_state.dart';
import 'package:onboarding/redux/movies_actions.dart';
import 'package:onboarding/viewmodel/home_screen_viewmodel.dart';
import 'package:onboarding/widgets/buildCardList.dart';
import 'package:onboarding/widgets/constants.dart';
import 'package:onboarding/widgets/newColors.dart';

import 'error_screen.dart';

class HomeScreenView extends StatefulWidget {
  HomeScreenView({this.title});

  final String title;

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final _controller = ScrollController();
  TextStyle customMainTextStyle;

  @override
  void didChangeDependencies() {
    customMainTextStyle = TextStyle(
        color: PaySmartColors.lightGreen,
        fontSize: MediaQuery.of(context).size.height * movieTitleTextSize);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Center(
          child: StoreConnector<AppState, HomeScreenViewModel>(
            onInit: (store) {
              //TODO add Loading screen to clean this
              store.dispatch(SetLoadingAction(true));
              store.dispatch(IncrementPageAction());
              store.dispatch(UpdateMovieListAction());
              _controller.addListener(() {
                if (_controller.position.pixels ==
                    _controller.position.maxScrollExtent) {
                  store.dispatch(SetLoadingAction(true));
                  store.dispatch(IncrementPageAction());
                  store.dispatch(UpdateMovieListAction());
                }
              });
            },
            converter: (store) => HomeScreenViewModel(store),
            builder: (context, HomeScreenViewModel vm) => Column(
              children: [
                Container(
                  color: PaySmartColors.lightBlue,
                  height: MediaQuery.of(context).size.height * subtitleBoxSize,
                  child: Center(
                    child: Text(
                      subtitleText,
                      style: TextStyle(
                          color: PaySmartColors.darkBlue,
                          fontSize: MediaQuery.of(context).size.height *
                              subtitleTextSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                buildMovieList(context, vm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildMovieList(BuildContext context, HomeScreenViewModel vm) {
    return Expanded(
      child: vm.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : vm.hasError
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ErrorScreen(),
                  ),
                )
               : BuildCardsList(
                  controller: _controller,
                  customMainTextStyle: customMainTextStyle,
                  listMovies: vm.moviesList,
                ),
    );
  }
}
