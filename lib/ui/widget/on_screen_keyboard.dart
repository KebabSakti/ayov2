import 'package:flutter/material.dart';

class OnScreenKeyboard extends StatelessWidget {
  final ValueChanged<String> onPressed;
  final ValueChanged<String> onNumberPressed;
  final VoidCallback onDelPressed;
  final VoidCallback onOkPressed;

  OnScreenKeyboard({
    @required this.onPressed,
    this.onNumberPressed,
    this.onDelPressed,
    this.onOkPressed,
  });

  void _keyboardButtonEvent(String value) {
    onPressed(value);

    if (onNumberPressed != null) if (value != 'OK' && value != 'DEL') {
      onNumberPressed(value);
    }
    if (onDelPressed != null) if (value == 'DEL') {
      onDelPressed();
    }

    if (onOkPressed != null) if (value == 'OK') {
      onOkPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OnScreenKeyboardButton(
                  '1',
                  onPressed: _keyboardButtonEvent,
                ),
                OnScreenKeyboardButton(
                  '2',
                  onPressed: _keyboardButtonEvent,
                ),
                OnScreenKeyboardButton(
                  '3',
                  onPressed: _keyboardButtonEvent,
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OnScreenKeyboardButton(
                  '4',
                  onPressed: _keyboardButtonEvent,
                ),
                OnScreenKeyboardButton(
                  '5',
                  onPressed: _keyboardButtonEvent,
                ),
                OnScreenKeyboardButton(
                  '6',
                  onPressed: _keyboardButtonEvent,
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OnScreenKeyboardButton(
                  '7',
                  onPressed: _keyboardButtonEvent,
                ),
                OnScreenKeyboardButton(
                  '8',
                  onPressed: _keyboardButtonEvent,
                ),
                OnScreenKeyboardButton(
                  '9',
                  onPressed: _keyboardButtonEvent,
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OnScreenKeyboardButton(
                  'DEL',
                  onPressed: _keyboardButtonEvent,
                  numberColor: Colors.redAccent,
                ),
                OnScreenKeyboardButton(
                  '0',
                  onPressed: _keyboardButtonEvent,
                ),
                OnScreenKeyboardButton(
                  'OK',
                  numberColor: Colors.green,
                  onPressed: _keyboardButtonEvent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnScreenKeyboardButton extends StatelessWidget {
  final String number;
  final Color numberColor;
  final ValueChanged<String> onPressed;

  OnScreenKeyboardButton(
    this.number, {
    this.numberColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          onPressed(number);
        },
        height: double.infinity,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[100]),
        ),
        child: Text(
          number,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: numberColor ?? Colors.grey[700],
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
