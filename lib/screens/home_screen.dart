import 'package:flutter/material.dart';
import 'package:light_calculator/calculator.dart';
import 'package:light_calculator/constants.dart';
import 'package:light_calculator/screens/widgets/displayer.dart';
import 'package:light_calculator/screens/widgets/keyboart.dart';
import 'package:light_calculator/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _primaryDisplayerText = '';
  String _secondaryDisplayerText = '';

  void buttonPressed(String id) {
    setState(
      () {
        if (id == ButtonId.ac) {
          _primaryDisplayerText = '';
          _secondaryDisplayerText = '';
        } else if (id == ButtonId.equal) {
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity) {
            _secondaryDisplayerText = _primaryDisplayerText;
            _primaryDisplayerText = cleanResult(result);
          } else {
            _secondaryDisplayerText = 'Bad expression';
          }
        } else if (id == ButtonId.backspace) {
          _primaryDisplayerText =
              _primaryDisplayerText.replaceAll(RegExp(r'.$'), '');
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity)
            _secondaryDisplayerText = cleanResult(result);
        } else {
          _primaryDisplayerText += id;
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity)
            _secondaryDisplayerText = cleanResult(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(left: 8),
          child: Text(kTitle),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Displayer(
                  primaryText: _primaryDisplayerText,
                  secondaryText: _secondaryDisplayerText),
            ),
            Expanded(
              flex: 2,
              child: Keyboard(buttonPressed),
            ),
          ],
        ),
      ),
    );
  }
}
