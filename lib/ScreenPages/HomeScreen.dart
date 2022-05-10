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
exitaction(){
    return SystemNavigator.pop();
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){return exitaction();},

      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
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
                              padding: const EdgeInsets.fromLTRB(10, 3, 5, 2),
                              child: Container(
                               width: MediaQuery.of(context).size.width *.80,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: const Offset(
                                          4.0,
                                         4.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                    ],
                                    color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: TextFormField(

                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search,size: 27),
                                  hintText:"Search by product or product code",
                                    border: OutlineInputBorder(),),
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.waves_sharp))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .29,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                            itemBuilder: (BuildContext context ,int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                borderRadius: BorderRadius.all(Radius.circular(05))
                              ),
                              height: MediaQuery.of(context).size.height*.20,

                              width: MediaQuery.of(context).size.width*.90,
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.purple,
                        child:ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                            itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.deepOrangeAccent,
                              width: MediaQuery.of(context).size.width*.20,
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Recently added catalogs',
                                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('See all'),
                            )
                          ],
                        ),
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
      ),
    );

  }
}
