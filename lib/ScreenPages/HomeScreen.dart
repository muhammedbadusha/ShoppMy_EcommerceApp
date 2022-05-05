import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25),
                color: Colors.white,
                height: MediaQuery.of(context).size.height*.11,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 200,
                    color: Colors.yellow,
                    child: Image.asset('assets/images/splashlogo.png',fit: BoxFit.cover,)
                ),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
