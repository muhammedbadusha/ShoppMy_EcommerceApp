import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orgfirstproject/Blocs/IdProductsBloc/id_products_bloc.dart';
import 'package:orgfirstproject/ModelClasses/ProductIdModel.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key? key, this.ProductId}) : super(key: key);
  String? ProductId;

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final value = 1;
  late List<ProductIdModel> productIdModel;

  @override
  void initState() {
    print(widget.ProductId);
    BlocProvider.of<IdProductsBloc>(context)
        .add(getProductIdEvent(widget.ProductId.toString()));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (value == 0) {
      return Scaffold(
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Coming soon...',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ])));
    } else {
      return BlocBuilder<IdProductsBloc, IdProductsState>(
        builder: (context, state) {

            if (state is ProductIdLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductIdLoaded) {
              productIdModel=BlocProvider.of<IdProductsBloc>(context).productIdModel;
              return  Scaffold(
                 body: Container(
                   width: MediaQuery.of(context).size.width,
                   color: Colors.red,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                         child: Container(
                           padding: EdgeInsets.only(left: 4,top: 10),
                           alignment: Alignment.centerLeft,
                           height: MediaQuery.of(context).size.height*.12,
                           width: MediaQuery.of(context).size.width*.90,
                           color: Colors.blue,
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.black,
                               borderRadius: BorderRadius.circular(10)
                             ),
                             height: MediaQuery.of(context).size.height*.05,
                             width: MediaQuery.of(context).size.width*.11,
                             child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)),
                           ),
                         ),
                       )
                     ],
                   ),
                 )

              );
            }
            if(state is ProductIdError){
              return Center(child: Text('Something went wrong Please check it'),);
            }
            return Center(child: Text('serverside Error'),);
        },
      );
    }
  }
}
//////////////////////////
//LayoutBuilder(builder: (context, constraints) {
//
//   return SingleChildScrollView(
//     child: ConstrainedBox(
//       constraints: BoxConstraints(minHeight: constraints.maxHeight),
//       child: Column(
//         children: [
//
//         ],
//       ),
//     ),
//   );
// }