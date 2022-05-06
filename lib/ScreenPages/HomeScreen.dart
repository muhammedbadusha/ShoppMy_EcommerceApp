import 'package:flutter/material.dart';
import 'package:orgfirstproject/ScreenPages/AccountPage.dart';
import 'package:orgfirstproject/ScreenPages/CatalogsPage.dart';
import 'package:orgfirstproject/ScreenPages/CollectionsPage.dart';
import 'package:orgfirstproject/ScreenPages/OrdersPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final pages = [
    HomeScreen(),
    CatalogsPage(),
    CollectionsPage(),
    OrdersPage(),
    AccountPage(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    _onTap();
  }

  _onTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => pages[selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return  SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * .40,
                              height: MediaQuery.of(context).size.height * .10,
                              child: Image.asset(
                                'assets/images/splashlogo.png',
                                fit: BoxFit.cover,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .27,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.purple,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .26,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.deepOrangeAccent,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                    ),

                  ],
                ),
              ),
            );
          }),

        ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ad_units),
            label: 'Catelogs',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: 'Collections',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Orders',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: Colors.red)
    );

  }
}
