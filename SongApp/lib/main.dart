import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:songapp/config/constants/themes/color_theme.dart';
import '/screens/list_of_songs.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    theme: getColorTheme(),
    title: "Music app",
    home: ListOfSongs(),
  ));
}
