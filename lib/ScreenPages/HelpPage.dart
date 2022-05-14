import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  final value=1;
  Widget build(BuildContext context) {
    if(value==0){
      return Scaffold(
        body:Center(child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Coming soon...',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
            )
          ]
        )
      ));
    }else{
      return Scaffold(
          backgroundColor: Colors.lightGreen,
          appBar: AppBar(
            title: Text('Help Page'),
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [],
                ),
              ),
            );
          }));
    }

  }
}
