import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  exitaction() {
    return SystemNavigator.pop();
  }

  final sampaleText = [
    'Personal care',
    "Women footwear",
    "Women Store",
    'Personal care',
    "Women footwear",
    "Women Store"
  ];
  final shopping = [
    "shopping1.jpg",
    "shopping2.jpeg",
    "shopping3.jpg",
    "shopping1.jpg",
    "shopping2.jpeg",
    "shopping3.jpg",
  ];
  final greenbig = [
    "wedding1.jpg",
    "redsaree.jpg",
    "wedding1.jpg",
    "redsaree.jpg"
  ];
  final yellows = [
    "wedding2.jpg",
    "redsaree1.jpg",
    "wedding2.jpg",
    "redsaree1.jpg"
  ];
  final oranges = [
    "wedding3.jpg",
    "redsaree2.jpg",
    "wedding3.jpg",
    "redsaree2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitaction();
      },
      child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            //color: Colors.red,
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
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
                                height:
                                    MediaQuery.of(context).size.height * .10,
                                child: Image.asset(
                                  'assets/images/splashlogo.png',
                                  fit: BoxFit.cover,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 5, 2),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: TextFormField(
                                  //: Colors.red,
                                  decoration: InputDecoration(
                                    hoverColor: Colors.red,
                                    prefixIcon: Icon(Icons.search, size: 27),
                                    hintText:
                                        "Search by product or product code",
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.yellowAccent)),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.backup_table,
                                  size: 27,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(context: context, builder: (BuildContext context){

                            return Container(
                              height: MediaQuery.of(context).size.height * .20,
                              // decoration: BoxDecoration(
                              //   color: Colors.red,
                              //   borderRadius: BorderRadius.only(
                              //     topLeft: Radius.circular(10),
                              //     topRight: Radius.circular(10)
                              //   )
                              // ),
                            );
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 05),
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xffb37bdb),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on_outlined),
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Text('Add delivery location to get extra discount'),
                              ),
                              Icon(Icons.double_arrow_rounded)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .10,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.purple,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: shopping.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  // color: Colors.blue,
                                  width:
                                      MediaQuery.of(context).size.width * .21,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/' +
                                                        shopping[index]),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                            color: Color(0xFFe0f2f1)),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // color: Colors.red,
                                          child: Text(
                                            sampaleText[index],
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.blue,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: shopping.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/' +
                                              shopping[index]),
                                          fit: BoxFit.cover),
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(05))),
                                  height:
                                      MediaQuery.of(context).size.height * .20,
                                  width:
                                      MediaQuery.of(context).size.width * .90,
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.purple,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sampaleText.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          1.0,
                                          1.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                    ],
                                  ),

                                  // width: MediaQuery.of(context).size.width*.20,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Text(
                                      sampaleText[index],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Recently added catalogs',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'See all',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .29,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.cyanAccent,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: greenbig.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(05))),
                                  height:
                                      MediaQuery.of(context).size.height * .20,
                                  width:
                                      MediaQuery.of(context).size.width * .90,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/mens/' +
                                                          greenbig[index]),
                                                  fit: BoxFit.cover),
                                              color: Colors.green,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              )),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .57,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .03,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .10,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3, left: 3),
                                                child: Text(
                                                  'New',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .13,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .32,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/mens/' +
                                                            yellows[index]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  color: Colors.limeAccent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            child: Image.asset(
                                              'assets/mens/' + oranges[index],
                                              fit: BoxFit.cover,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .32,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .13,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/mens/' +
                                                            oranges[index]),
                                                    fit: BoxFit.cover),
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10),
                                                )),
                                            //child: Image.asset(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .29,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.blue,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: shopping.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/' +
                                              shopping[index]),
                                          fit: BoxFit.cover),
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(05))),
                                  height:
                                      MediaQuery.of(context).size.height * .20,
                                  width:
                                      MediaQuery.of(context).size.width * .90,
                                ),
                              );
                            }),
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
              selectedItemColor: Colors.red)),
    );
  }
}
