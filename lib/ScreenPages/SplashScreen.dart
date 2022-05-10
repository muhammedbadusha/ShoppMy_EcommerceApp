import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orgfirstproject/ScreenPages/HomeScreen.dart';
import 'package:orgfirstproject/ScreenPages/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
String? signcheck;
  void initState() {
    // TODO: implement initState
    super.initState();
    splashFunction();

  }

Future<void> getSavedData()async{

  final sharePrefobj1=await SharedPreferences.getInstance();
  final signcheck=sharePrefobj1.getString('LoginResponse');

    if(signcheck=="true"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      print('if $signcheck');
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      print('else $signcheck');

    }
}
  @override

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/images/splashlogo.png')
    );
  }
  void splashFunction()async{
await Future.delayed(Duration(seconds: 5),(){});
getSavedData();
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

  }

}
