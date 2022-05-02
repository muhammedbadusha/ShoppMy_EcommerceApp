import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orgfirstproject/Blocs/Passwordeye/hide_text_bloc.dart';
import 'package:orgfirstproject/ScreenPages/LoginPage.dart';
import 'package:orgfirstproject/ScreenPages/SplashScreen.dart';

main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HideTextBloc()),

      ],
      child: MaterialApp(
        theme: ThemeData(

          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home:LoginPage(),
        //SplashScreen(),
      ),
    );
  }
}
