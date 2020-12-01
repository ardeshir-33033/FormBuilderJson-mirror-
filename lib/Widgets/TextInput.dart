import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  String name;
  String value;
  String hint;
  TextStyle style;
  BoxDecoration containerDecoration;
  Function(String name, String result) OnChangeCallback;

  TextInput({
    @required this.name,
    @required this.value,
    @required this.hint,
    @required this.OnChangeCallback,
    this.style,
    this.containerDecoration,
  });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: widget.containerDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
      width: 400,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:TextField(
          style: widget.style ?? TextStyle(),
          controller: TextEditingController(
            text: widget.value ?? 'hell',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint ?? "h",
          ),
          onChanged: (value) {
            widget.OnChangeCallback(widget.name, value);
          },
        ),
      ) 
    );
  }
}
