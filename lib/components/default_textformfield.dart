import 'package:flutter/material.dart';

Widget defaultTextFormField ({
  required String hintText,
  required IconData icon,
  Color color=Colors.white,
  Color hintTextcolor=Colors.white,
  bool   obscureText= false,
  TextInputType Type =TextInputType.text,

  required TextEditingController controller,


} )=> TextFormField(
  obscureText:obscureText ,
  keyboardType:Type ,
  controller: controller ,
  style: TextStyle(color: hintTextcolor),
  decoration: InputDecoration(
      hintText: '$hintText',
      hintStyle: TextStyle(color: hintTextcolor),
      prefixIcon: Icon(
        icon,
        color: color,

      ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white  ),
    ),


  ),
);