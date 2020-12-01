import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Widgets/DateInput.dart';

import 'DateTimeInput.dart';
import 'DropDownComponent.dart';
import 'RadioListBuilder.dart';

class ManaForm extends StatefulWidget {
  String title;
  String description;
  Widget widgets;
  ButtonBar buttons;
  BoxDecoration formDecoration;
  double formWidth;
  double formHeight;

  ManaForm({
    @required this.title,
    @required this.widgets,
    @required this.buttons,
    this.formDecoration,
    this.description,
    this.formHeight,
    this.formWidth,
  });

  @override
  _ManaFormState createState() => _ManaFormState();
}

class _ManaFormState extends State<ManaForm> {
  double SliderRating = 50.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: widget.formDecoration ?? BoxDecoration(),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:  EdgeInsets.only(right:8.0),
                child: Text(
                  widget.description,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              width: widget.formWidth ?? MediaQuery.of(context).size.width,
              height: widget.formHeight ??
                  MediaQuery.of(context).size.height - 200.0,
              child: SingleChildScrollView(
                child: widget.widgets,
              ),
            ),
            widget.buttons,
          ],
        ),
      ),
    );
  }
}
