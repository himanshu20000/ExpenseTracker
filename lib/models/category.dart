import 'dart:ffi';

import 'package:flutter/material.dart';

class Categories {
  String CateImg;
  String Title;
  String Desc;
  int addDed;
  String time;
  Color cardbg;

  Categories(
      {required this.CateImg,
      required this.Title,
      required this.Desc,
      required this.addDed,
      required this.time,
      required this.cardbg});
}
