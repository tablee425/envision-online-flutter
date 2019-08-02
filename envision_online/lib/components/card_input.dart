import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/utils/constants.dart';

class CardInput extends StatefulWidget {
  final String inputType;
  final Function(String) callback;
  _CardInputState _cardInputState;
  CardInput({String inputType, Function(String) callback}) : inputType = inputType, callback = callback;

  void resetText() {
    _cardInputState.resetText();
  }

  @override
  _CardInputState createState() => _cardInputState = new _CardInputState();
}

class _CardInputState extends State<CardInput> {

  TextEditingController editorController = new TextEditingController(text: '');
  FocusNode _textFocus = new FocusNode();

  @override
  void initState() {
    super.initState();
    editorController.addListener(_onChange);
    _textFocus.addListener(_onChange);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      margin: EdgeInsets.only(top: 0, left: 5.0, right: 5.0),
      elevation: 3.0,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new TextFormField(
                controller: editorController,
                focusNode: _textFocus,
                decoration: InputDecoration(
                  labelText: widget.inputType,
                  labelStyle: TextStyle(fontSize: 18.0),
                  contentPadding: new EdgeInsets.symmetric(vertical: 3 , horizontal: 3),
                ),
                keyboardType: widget.inputType == InputTypes.Email ? TextInputType.emailAddress : TextInputType.text,
                obscureText: widget.inputType == InputTypes.Password,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onChange() {
    String text = editorController.text;
    widget.callback(text);
  }

  static Widget getCardInput(String _inputType, Function(String) _callback) {
    return new CardInput(
      inputType: _inputType,
      callback: _callback,
    );
  }

  void resetText() {
    setState(() {
      editorController.clear();
    });
  }
}
