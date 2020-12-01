import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Widgets/CheckboxInput.dart';
import 'package:flutter_app1/Widgets/DateInput.dart';
import 'package:flutter_app1/Widgets/DateTimeInput.dart';
import 'package:flutter_app1/Widgets/DropDownComponent.dart';
import 'package:flutter_app1/Widgets/ManaForm.dart';
import 'package:flutter_app1/Widgets/RadioListBuilder.dart';
import 'package:flutter_app1/Widgets/TextInput.dart';
import 'package:flutter_app1/Widgets/SliderInput.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FormBuilder extends StatefulWidget {
  String formTitle;
  String formDescription;
  ButtonBar formButtons;
  Map<String, dynamic> model;
  TextStyle textStyle;
  BoxDecoration inputContainerDecoration;
  BoxDecoration formContainerDecoration;

  Function(Map<String, dynamic> result) OnSubmitCallback;
  Function(Map<String, dynamic> result) OnCancelCallback;
  Function(Map<String, dynamic> result) OnCleanFormCallback;

  FormBuilder({
    this.formButtons,
    this.model,
    this.formContainerDecoration,
    this.formDescription,
    this.formTitle,
    this.inputContainerDecoration,
    this.OnCancelCallback,
    this.OnCleanFormCallback,
    this.OnSubmitCallback,
  });

  @override
  _FormBuilderState createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  List<Widget> fields = List<Widget>();
  String radioName;
  int radioIndex;
  double SliderRating = 50;
  String dropdownValue;
  List RadioList = ['یک', 'دو', 'سه'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fields.add(
      Padding(
        padding: EdgeInsets.all(7.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropDownRow(
            rowTitle: 'پاساژ',
            dropdownValue: dropdownValue,
            itemsList: ['1', '2', '3'],
          ),
        ),
      ),
    );

    widget.model.forEach((key, value) {
      fields.add(InputDetector(key, value));
    });

    fields.add(
      RadioListBuilder(
        RadioList: RadioList,
          onRadioCallBack: (name , value){
          widget.model[name] = value;
          },
      ),
    );

    // fields.add(
    //     SliderInput(min: 1.0, max: 50.0, rating: 20.0, OnSliderChange: (name, value){
    //       widget.model[name] = value;
    //     },)
    // );

    // fields.add(
    //   Container(width: 500, height: 90, child: CupertinoPickerDemo()),
    // );
    // fields.add(
    //   Container(
    //       width: 500,
    //       height: 50,
    //       child: CalendarJalali(taghPicker: false, gregoryConv: false)),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ManaForm(
              title: "نمونه فرم",
              description: "توضیحات",
              widgets: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: fields,
                ),
              ),
              buttons: widget.formButtons,
            ),
          ),
        ),
      ),
    );
  }

  Widget InputDetector(String key, dynamic value) {
    switch (value.runtimeType) {
      case String:
        return TextInput(
            value: value,
            hint: key,
            name: key,
            OnChangeCallback: (name, value) {
              widget.model[name] = value;
            });
      case int:
        return TextInput(
            value: value.toString(),
            hint: key.toString(),
            name: key,
            OnChangeCallback: (name, value) {
              widget.model[name] = int.parse(value);
            });
      case bool:
        return CheckBoxFromjson(
          name: key,
          key1: key,
          value: value,
          onCheckBoxCallBack: (name , value){
            widget.model[name] = value;
          },
        );
      case DateTime:
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 500,
                height: 80,
                color: Colors.white,
                child: CupertinoPickerDemo(
                  enteredVal: value,
                ),
              ),
              Container(
                width: 400,
                child: CalendarJalali(
                  taghPicker: false,
                  gregoryConv: false,
                  name: key,
                  onCalendarChoose: (name, value) {
                    widget.model[name] = value;
                  },
                ),
              ),

            ],
          ),
        );
      case double:
        return SliderInput(
          name: key,
          min: 0.0,
          max: 50.0,
          rating: 10.0,
          OnSliderChange: (name, value) {
            widget.model[name] = value;
          },
        );
    }
  }
}
