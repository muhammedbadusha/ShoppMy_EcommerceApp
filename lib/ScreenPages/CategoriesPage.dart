import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.clear_all,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Categories',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(

          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .20,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.red,
                      elevation: 3,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8,top: 8),
                            child: Container(
                              height: MediaQuery.of(context).size.height *.03,
                              width: MediaQuery.of(context).size.width*.21,
                              child: Card(

                                child: Text("100+New",style:GoogleFonts.mukta(textStyle: TextStyle(color: Colors.black))
                               // TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                                ),),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2,right: 2),
                  child: GridView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                          crossAxisCount: 2),
                      itemCount: 10,

                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.blue,
                        );
                      }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
