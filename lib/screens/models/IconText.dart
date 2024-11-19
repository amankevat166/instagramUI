import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IconText{

  final IconData iconData;
  final String text;

  IconText(this.iconData, this.text);

  static List<IconText> items = [
    IconText(Icons.tv,"IGTV"),
    IconText(Icons.shopping_bag,"Shop"),
  ];
}