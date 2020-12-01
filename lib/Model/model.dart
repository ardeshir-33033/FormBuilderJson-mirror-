import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Model {
  int num;
  String name;
  String fname;
  String tex;
  bool chalgo;
  DateTime dateTime;
  double price;

  Model({
    this.num,
    this.tex,
    this.name,
    this.price,
    this.fname,
    this.chalgo,
    this.dateTime,
  });

  Model.fromJson(Map<String, dynamic> json) {
    num = json["name"];
    tex = json["id"];
    name = json["name"];
    fname = json["fname"];
    chalgo = json["chalgo"];
    dateTime = json["dateTime"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tex != null) data['name'] = this.tex;
    if (this.num != null) data['id'] = this.num;
    if (this.name != null) data['name'] = this.name;
    if (this.fname != null) data['fname'] = this.fname;
    if (this.chalgo != null) data['chalgo'] = this.chalgo;
    if (this.dateTime != null) data['dateTime'] = this.dateTime;
    if (this.price != null) data['price'] = this.price;

    return data;
  }

  List<Model> listFromJson(dynamic jsns) {
    if (jsns != null) {
      return jsns.map<Model>((ct) {
        return Model.fromJson(ct);
      }).toList();
    }

    return null;
  }
// var dds = Model(num:  2  , tex: 'hell').toJson();
//
// var ssss =  dds.values.first().runtimeType;

}
