import 'package:flutter/material.dart';

class Responsive {
 static double height(BuildContext context){
  return MediaQuery.of(context).size.height;
}

static double width(BuildContext context){
  return MediaQuery.of(context).size.height;
}
}
