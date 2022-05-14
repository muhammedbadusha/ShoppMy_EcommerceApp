import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orgfirstproject/Blocs/AllProductsBloc/all_productsbloc_bloc.dart';
import 'package:orgfirstproject/ModelClasses/AllProductModel.dart';
import 'package:orgfirstproject/ScreenPages/AccountPage.dart';
import 'package:orgfirstproject/ScreenPages/CategoriesPage.dart';
import 'package:orgfirstproject/ScreenPages/OrdersPage.dart';
import 'package:orgfirstproject/ScreenPages/HelpPage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  final pages = [
    const HomeScreen(),
    const CategoriesPage(),
    const OrdersPage(),
    const HelpPage(),
    const AccountPage(),
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
 late List<AllProductModel> allProductModel;
  @override
  // void initState() {
  //   BlocProvider.of<AllProductsblocBloc>(context).add(getAllProductsEvent());
  //   // TODO: implement initState
  //   super.initState();
  // }
  void initState() {
    BlocProvider.of<AllProductsblocBloc>(context).add(getAllProductsEvent());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return exitaction();
        },
        child: Scaffold(
            body: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 25),
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .40,
                                height:
                                    MediaQuery.of(context).size.height * .10,
                                child: Image.asset(
                                  'assets/images/splashlogo.png',
                                  fit: BoxFit.cover,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
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
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(
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
                                  decoration: const InputDecoration(
                                    hoverColor: Colors.red,
                                    prefixIcon: Icon(Icons.search, size: 27),
                                    hintText:
                                        "Search by product or product code",
                                    // focusedErrorBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(4)),
                                    //     borderSide: BorderSide(
                                    //         width: 1,
                                    //         color: Colors.yellowAccent)),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
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
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .20,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(13),
                                            topRight: Radius.circular(13))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 05),
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'ADD DELIVERY LOCATION',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    icon: const Icon(
                                                      Icons.clear,
                                                      color: Colors.grey,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          indent: 2,
                                          endIndent: 2,
                                          color: Colors.grey,
                                          height: 4,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, right: 30),
                                          child: SizedBox(
                                            //color: Colors.red,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .80,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .05,
                                            child: TextFormField(
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    6),
                                              ],
                                              decoration: InputDecoration(
                                                suffix: TextButton(
                                                    onPressed: () {},
                                                    child: const Text('SUBMIT',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFCB7C8E),
                                                        ))),
                                                hintText:
                                                    "Type Delivery Pincode",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 05),
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width,
                          color: const Color(0xffb37bdb),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(Icons.location_on_outlined),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Text(
                                    'Add delivery location to get extra discount'),
                              ),
                              Icon(Icons.double_arrow_rounded)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .10,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.purple,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: shopping.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
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
                                            color: const Color(0xFFe0f2f1)),
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
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
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
                                      borderRadius: const BorderRadius.all(
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
                      SizedBox(
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
                                  decoration: const BoxDecoration(
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
                                        offset: Offset(
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
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Recently added catalogs',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
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
                      SizedBox(
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
                                  decoration: const BoxDecoration(
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
                                              borderRadius:
                                                  const BorderRadius.only(
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
                                              decoration: const BoxDecoration(
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
                                              child: const Padding(
                                                padding: EdgeInsets.only(
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
                                                      const BorderRadius.only(
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
                                                borderRadius:
                                                    const BorderRadius.only(
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
                        //color: Colors.purple,
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width,

                        //color: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Product For You',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'View all',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
               BlocBuilder<AllProductsblocBloc,
              AllProductsblocState>(
              builder: (context, state) {

                if (state is AllProductsblcLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is AllProductsblocLoaded) {
                  allProductModel=BlocProvider.of<AllProductsblocBloc>(context).allProductModel;
                 return GridView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .65,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5, crossAxisCount: 2),
                      itemCount: allProductModel.length,
                      itemBuilder: (BuildContext ctx,int index) {
                        return Container(
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .20,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.blue,
                                child: Center(
                                  child: Text('product image'),
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:6.5),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * .14,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(allProductModel[index].productName.toString()),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });

                }
                if (state is AllProductsblocError) {
                  return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .20,
                        width: MediaQuery.of(context).size.width*.80,
                        child: Card(
                          elevation: 10,

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  'Error!',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 18),),
                              Text(
                                  'Oops,something went wrong Please try again later.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
                            ],
                            ),
                          ),
                        ),
                      ));
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Sorry! Serverside Error')
                    ],
                  ),
                );
              }),
                    ],
                  ),
                ),
              );
            }),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.grey,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps_outlined),
                    label: 'Categories',
                    backgroundColor: Colors.grey,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined),
                    label: 'Orders',
                    backgroundColor: Colors.grey,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.help),
                    label: 'Help',
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
                selectedItemColor: Colors.red)));
  }
}
