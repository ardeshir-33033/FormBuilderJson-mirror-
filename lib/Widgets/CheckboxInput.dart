import 'package:flutter/material.dart';

class CheckBoxFromjson extends StatelessWidget {
  Function (String name , bool Value)onCheckBoxCallBack;
  String name;
  String key1;
  bool value;
  CheckBoxFromjson({
    this.name,
    this.key1,
    this.value,
    this.onCheckBoxCallBack
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return CheckboxListTile(
            // checkColor: Color(0xFFEB5151),
            activeColor:  Color(0xFFEB5151),
            title: Text(key1),
            value: value,
            onChanged: (bool value1) {
              setState(() {
                value = value1;
                onCheckBoxCallBack(name , value1);
              });
            },
          );
        },
      ),
    );
  }
}
