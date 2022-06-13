
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {



  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/main_home_page_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: MediaQuery.of(context).size.width/6),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:Image.asset(
              "assets/images/selectionImages/b_17_type_1.gif",
              height: MediaQuery.of(context).size.width/2,
              width: MediaQuery.of(context).size.height/3,
            ),
          )
        ),
      ),
    );
  }
}
