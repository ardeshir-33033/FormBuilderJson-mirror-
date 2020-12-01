import 'package:flutter/material.dart';


class DropDownRow extends StatefulWidget {
  List<String> itemsList;
  String dropdownValue;
  String rowTitle;

  DropDownRow(
      {@required this.rowTitle,
        @required this.dropdownValue,
        @required this.itemsList});

  @override
  _DropDownRowState createState() => _DropDownRowState();
}

class _DropDownRowState extends State<DropDownRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            widget.rowTitle,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width / 3,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.dropdownValue,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Color(0xFF8F111D),
                  ),
                ],
              ),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  widget.dropdownValue = newValue;
                });
              },
              items: widget.itemsList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
