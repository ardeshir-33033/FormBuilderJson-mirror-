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
