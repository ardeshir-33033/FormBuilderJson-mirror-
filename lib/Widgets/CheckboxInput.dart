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




//
// class CheckBoxListBuilder extends StatefulWidget {
//   Map<String, bool> values = {};
//
//   CheckBoxListBuilder({@required this.values});
//
//   @override
//   CheckBoxListBuilderState createState() => new CheckBoxListBuilderState();
// }
//
// class CheckBoxListBuilderState extends State<CheckBoxListBuilder> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 100,
//       child: ListView(
//         children: widget.values.keys.map((String key) {
//           return SizedBox(
//             height: 30,
//             child: CheckboxListTile(
//               dense: true,
//               activeColor: Color(0xFF8F111D),
//               title: Text(
//                 key,
//                 style: TextStyle(fontSize: 15.0),
//               ),
//               value: widget.values[key],
//               onChanged: (bool value) {
//                 setState(() {
//                   widget.values[key] = value;
//                 });
//               },
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
