import 'dart:async';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Administrator/Desktop/MirrorTest/2/flutter_app1/lib/Provider/datePicker.dart';

// import 'package:jalali_calendar/jalali_calendar.dart';
import 'package:persian_date/persian_date.dart';

class CalendarJalali extends StatefulWidget {
  String name;
  bool taghPicker;
  Widget taghvimButton;
  Widget pickerButton;
  bool gregoryConv;

  Function (String name, String result) onCalendarChoose;

  CalendarJalali({
    @required this.name,
    @required this.taghPicker,
    this.pickerButton,
    this.taghvimButton,
    @required this.gregoryConv,
    this.onCalendarChoose
  });

  @override
  _State createState() => new _State();
}

class _State extends State<CalendarJalali> {
  PersianDate persianDate = PersianDate(format: "yyyy/mm/dd  \n DD  , d  MM  ");
  String _datetime = '';
  String _format = 'yyyy-mm-dd';
  String _value = '';
  String _valuePiker = '';
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    print(
        "Parse TO Format ${persianDate.gregorianToJalali("2019-02-20T00:19:54.000Z", "yyyy-m-d hh:nn")}");

     DateTime date = DateTime.now();
     _valuePiker = "${date.year}/${date.month}/${date.day}";
  }

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _showDatePicker();
                  },
                  child: widget.taghvimButton == null
                      ? Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'تقویم',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        )
                      : widget.taghvimButton,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Text(
                    _valuePiker,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0 , color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(context,
        minYear: 1300,
        maxYear: 1450,
/*      initialYear: 1368,
      initialMonth: 05,
      initialDay: 30,*/
        confirm: Text(
          'تایید',
          style: TextStyle(color: Colors.red),
        ),
        cancel: Text(
          'انصراف',
          style: TextStyle(color: Colors.cyan),
        ),
        dateFormat: _format, onChanged: (year, month, day) {
      if (!showTitleActions) {
        _changeDatetime(year, month, day);
      }
    }, onConfirm: (year, month, day) {
      _changeDatetime(year, month, day);
      _valuePiker = "$_datetime";
      widget.onCalendarChoose(widget.name , _valuePiker);
      //"\n Year : $year \n  Month :   $month \n  Day :  $day";
    });
  }

  void _changeDatetime(int year, int month, int day) {
    setState(() {
      _datetime = '$year-$month-$day';
    });
  }
}
