import 'package:flutter/material.dart';
import 'package:light_calculator/constants.dart';

class KeyboardButton extends StatelessWidget {
  final String id;
  final VoidCallback onPressed;
  KeyboardButton({@required this.id, @required this.onPressed});

  
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: onPressed,
          onLongPress: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: Color(0xFF272B33),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: setChild(id),
        ),
      ),
    );
  }
}

Widget setChild(String id) {
  if (id == ButtonId.backspace)
    return Icon(
      Icons.backspace_outlined,
      color: Color(0xFFF57B7B),
    );

  if (id == ButtonId.ac)
    return Text(
      id,
      style: TextStyle(
        color: Color(0xFFF57B7B),
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );

  if (RegExp(r'[\d\.]').hasMatch(id))
    return Text(
      id,
      style: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );

  return Text(
    id,
    style: TextStyle(
      color: Color(0xFF26F4CE),
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
