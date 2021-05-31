import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:onboarding/redux/app_state.dart';
import 'package:onboarding/redux/movies_actions.dart';
import 'package:onboarding/viewmodel/home_screen_viewmodel.dart';
import 'package:onboarding/widgets/constants.dart';
import 'package:onboarding/widgets/newColors.dart';

import 'home_screen_view.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(errorScreenTitle),
          //TODO finish screen
        ),
        body: Center(
          child: StoreConnector<AppState, HomeScreenViewModel>(
            onInit: (store) {},
            converter: (store) => HomeScreenViewModel(store),
            builder: (context, HomeScreenViewModel vm) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Check internet connection',
                    style: TextStyle(
                        color: PaySmartColors.darkBlue,
                        fontSize: MediaQuery.of(context).size.height *
                            subtitleTextSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      listDividerHorizontalSize,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * subtitleBoxSize,
                  child: RaisedButton(
                    color: PaySmartColors.darkBlue,
                    onPressed: () {
                      print('Try again pressed'); //TODO delete print
                      print('vm.hasError: ${vm.hasError}'); //TODO delete print
                      if (!vm.hasError) {
                        print(
                            'vm.hasError: ${vm.hasError}'); //TODO delete print
                        Navigator.pop(context);
                        print('tried to pop screen'); //TODO delete print
                      }
                    },
                    splashColor: PaySmartColors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonBorderRadius),
                    ),
                    padding: const EdgeInsets.all(buttonPadding),
                    child: Text(
                      'Try again',
                      style: TextStyle(
                          color: PaySmartColors.lightBlue,
                          fontSize: MediaQuery.of(context).size.height *
                              subtitleTextSize),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
