import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';

Map<int, Color> color =
{
50:const Color.fromRGBO(136,14,79, .1),
100:const Color.fromRGBO(136,14,79, .2),
200:const Color.fromRGBO(136,14,79, .3),
300:const Color.fromRGBO(136,14,79, .4),
400:const Color.fromRGBO(136,14,79, .5),
500:const Color.fromRGBO(136,14,79, .6),
600:const Color.fromRGBO(136,14,79, .7),
700:const Color.fromRGBO(136,14,79, .8),
800:const Color.fromRGBO(136,14,79, .9),
900:const Color.fromRGBO(136,14,79, 1),
};

// Color PAlete
final MaterialColor button = const Color.fromARGB(255, 0, 122, 244).toMaterialColor();
final MaterialColor lessfaintblue = const Color.fromRGBO(93, 124, 166, 65).toMaterialColor();
final MaterialColor appbar = const Color.fromRGBO(38,94,65,1).toMaterialColor();
final MaterialColor grey1 = const Color.fromRGBO(204, 204, 204, 80).toMaterialColor();
final MaterialColor grey2 = const Color.fromRGBO(163, 163, 163, 80).toMaterialColor();
final MaterialColor faintBlue = const Color.fromRGBO(197, 208, 217, 85).toMaterialColor();
final MaterialColor white = const  Color.fromRGBO(242, 242, 242, 95).toMaterialColor();


final lightThemeData =  ThemeData(
    primarySwatch: appbar,
    appBarTheme: AppBarTheme(
      color: appbar,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 20
    )
);