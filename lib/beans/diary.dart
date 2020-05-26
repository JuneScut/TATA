import 'package:flutter/material.dart';

class DiaryBean {
  String id;
  String name;
  Color color;

  DiaryBean(this.id, this.name, this.color);
  String get getId => id;

  set setId(String id) => this.id = id;

  String get getName => name;

  set setName(String name) => this.name = name;

  Color get getColor => color;

  set setColor(Color color) => this.color = color;
}