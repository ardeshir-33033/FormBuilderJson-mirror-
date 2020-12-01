import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app1/Provider/FormBuilder.dart';
import 'dart:convert';
import 'Model/model.dart';

void main() {
  runApp(
    FormBuilder(
      model: Model(
        //num: 23,
        name: 'darkko',
        fname: 'fag',
        tex: 'hell',
        chalgo: false,
        price: 150.0,
        dateTime: DateTime.now(),
      ).toJson(),
      formButtons: ButtonBar(
        children: [
          Container(
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  color: Colors.red,
                  onPressed: (){},
                  child: Text('Add'),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: (){},
                  child: Text('clear'),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: (){},
                  child: Text('confirm'),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: (){},
                  child: Text('delete'),
                ),
              ],
            ),
          )
        ],
      )
    ),
  );
}
//
// class modJson extends StatefulWidget {
//   Map<String, dynamic> model;
//   Function(Map<String, dynamic> json) callBack;
//
//
//   modJson({this.model, this.callBack});
//
//   @override
//   _modJsonState createState() => _modJsonState();
// }
//
// class _modJsonState extends State<modJson> {
//   List<Widget> columnList = List<Widget>();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Function Canceltap() {
//       print('hello');
//     };
//     Function Addtap() {
//       print('hello');
//     };
//     Function Cleartap() {
//       print('hello');
//     };
//     // var dds = Model(num:  2  , tex: 'hell').toJson().toString();
//     jsonFuctionBuilder(columnList: columnList,
//         CancelButtonPress: Canceltap,
//         CancelbuttonColor: Colors.red,
//         addButtonPress: Addtap,
//         addButtonColor: Color(0xFFEB5151),
//         clearButtonPress: Cleartap,
//         clearButtonColor: Colors.redAccent,
//         callback: callBack);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child:FormBuilder(model: Model(num: 23,
//             name: 'darkko',
//             fname: 'fag',
//             tex: 'hell',
//             address: 'trex',)
//               .toJson(),),
//         ),
//       ),
//     );
//   }
// }
//
// Function jsonFuctionBuilder({List<
//     Widget> columnList, Function CancelButtonPress, Color CancelbuttonColor, Function addButtonPress, Color addButtonColor, Function clearButtonPress, Color clearButtonColor, Function callback}) {
//   var dds2 =
//   Model(num: 23,
//       name: 'darkko',
//       fname: 'fag',
//       tex: 'hell',
//       address: 'trex')
//       .toJson();
//   dds2.forEach(
//         (key, value) {
//       Type typeVal = value.runtimeType;
//       switch (typeVal) {
//         case String:
//           {
//             columnList.add(
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: Colors.white,
//                   ),
//                   width: 400,
//                   child: Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Text',
//                       ),
//                       controller: TextEditingController(text: dds2[key]),
//                       onChanged: (value) {
//                         dds2[key] = value;
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             );
//             break;
//           }
//         case int:
//           {
//             columnList.add(
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: Colors.white,
//                   ),
//                   width: 400,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 8.0),
//                     child: TextField(
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Value',
//                       ),
//                       controller:
//                       TextEditingController(text: dds2[key].toString()),
//                       onChanged: (value) {
//                         dds2[key] = int.parse(value);
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             );
//             break;
//           }
//       }
//     },
//   );
//   columnList.add(
//     RaisedButton(
//       onPressed: () {
//
//       },
//       color: addButtonColor,
//       child: Text(
//         'add',
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
//   columnList.add(
//     RaisedButton(
//       onPressed: CancelButtonPress,
//       color: CancelbuttonColor,
//       child: Text(
//         'Cancel',
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
//   columnList.add(
//     RaisedButton(
//       onPressed: clearButtonPress,
//       color: clearButtonColor,
//       child: Text(
//         'Cancel',
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   );
//   // var myJSON = '{"name":"John", "age":31, "city":"New York"}';
//   //
//   // var hh = json.decode(myJSON);
//   // var dds3 = Model(num: 23, tex: 'hell').toJson();
// }
