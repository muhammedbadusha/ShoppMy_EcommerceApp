import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orgfirstproject/ApiCalls/ProductApi.dart';
import 'package:orgfirstproject/ApiCalls/UserApi.dart';
import 'package:orgfirstproject/Blocs/AllProductsBloc/all_productsbloc_bloc.dart';
import 'package:orgfirstproject/Blocs/LoginBloc/loginbloc_bloc.dart';
import 'package:orgfirstproject/Blocs/Passwordeye/hide_text_bloc.dart';
import 'package:orgfirstproject/Blocs/SignupBloc/signupbloc_bloc.dart';
import 'package:orgfirstproject/ScreenPages/CategoriesPage.dart';
import 'package:orgfirstproject/ScreenPages/HelpPage.dart';
import 'package:orgfirstproject/ScreenPages/HomeScreen.dart';
import 'package:orgfirstproject/ScreenPages/LoginPage.dart';
import 'package:orgfirstproject/ScreenPages/OrdersPage.dart';
import 'package:orgfirstproject/ScreenPages/SplashScreen.dart';



main()async{

  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
UserApi userApi=UserApi();
ProductApi productApi =ProductApi();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HideTextBloc()),
BlocProvider(create: (context)=>SignupblocBloc(userApi)),
        BlocProvider(create: (context)=>LoginblocBloc(userApi)),
        BlocProvider(create: (context)=>AllProductsblocBloc(productApi)),
      ],
      child: MaterialApp(
        theme: ThemeData(
//primaryColorDark: Colors.red,
          primaryColor: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home:HomeScreen(),
        routes: {
          "logout":(context)=> LoginPage(),
        },
        //SplashScreen(),
      ),
    );
  }
}
