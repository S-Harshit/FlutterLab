import 'package:flutter/material.dart';
import 'package:registration/widgets/text_area.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black45.withOpacity(0.3), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage("assets/images/background.jpg"))),
      child: SafeArea(
        child: Material(child: TextArea()),
      ),
    );
  }
}
