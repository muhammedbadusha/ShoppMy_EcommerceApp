import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orgfirstproject/ApiCalls/UserApi.dart';
import 'package:orgfirstproject/Blocs/Passwordeye/hide_text_bloc.dart';
import 'package:orgfirstproject/Blocs/SignupBloc/signupbloc_bloc.dart';
import 'package:orgfirstproject/ScreenPages/HomeScreen.dart';
import 'package:orgfirstproject/ScreenPages/LoginPage.dart';
import 'package:orgfirstproject/ScreenPages/SignupPage.dart';
import 'package:orgfirstproject/ScreenPages/SplashScreen.dart';

main(){
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
UserApi userApi=UserApi();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HideTextBloc()),
BlocProvider(create: (context)=>SignupblocBloc(userApi)),
      ],
      child: MaterialApp(
        theme: ThemeData(

          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home:HomeScreen(),
        //SplashScreen(),
      ),
    );
  }
}
