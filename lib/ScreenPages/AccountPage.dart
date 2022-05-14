import 'package:flutter/material.dart';
import 'package:orgfirstproject/ScreenPages/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logoutClear() async {
      final sharePrefobj1 = await SharedPreferences.getInstance();
      sharePrefobj1.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    }

    logountFun() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        logoutClear();
                      },
                      child: Text('yes')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No'))
                ],
              ),
              title: Text('Are you sure Logout?'),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('AccountPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.red,
          child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    logountFun();
                  },
                  child: Text('Log Out Account'))),
        ),
      ),
    );
  }
}
