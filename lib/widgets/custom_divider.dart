import 'package:flutter/material.dart';

import 'constants.dart';
import 'newColors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: listPaddingVerticalSize,
          horizontal: MediaQuery.of(context).size.width *
              listTextDividerHorizontalSize),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * listDividerHorizontalSize,
        child: Divider(
          color: PaySmartColors.lightBlue,
        ),
      ),
    );
  }
}
