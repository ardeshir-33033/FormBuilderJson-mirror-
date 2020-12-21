import 'package:flutter/material.dart';


class RadioListBuilder extends StatefulWidget {
  List RadioList;
  int chosenIndex;
  String name;
  Function (String name , int chosenIndex) onRadioCallBack;

  RadioListBuilder({@required this.RadioList , this.name , this.chosenIndex , this.onRadioCallBack});

  @override
  _RadioListBuilderState createState() => _RadioListBuilderState();
}

class _RadioListBuilderState extends State<RadioListBuilder> {
  int checkedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemExtent: 41,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.RadioList[index], style: TextStyle(fontSize: 15),),
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Color(0xFF8F111D),
                        value: index,
                        groupValue: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue;
                            widget.onRadioCallBack(index.toString() , newValue);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Divider(
              //   height: 1,
              //   thickness: 1,
              // )
            ],
          );
        },
        itemCount: widget.RadioList.length,
      ),
    );
  }
}
