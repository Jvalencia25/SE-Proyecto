import 'package:erp_reposteria/constants.dart';
import 'package:erp_reposteria/util/my_box.dart';
import 'package:flutter/material.dart';
class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      drawer: MyDrawer,
      body: Column(
        children: [
          //4 box on the top
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
            child: SizedBox(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: 
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
            itemBuilder: (context,index){
              return MyBox();
            }),
            ),
            ),
          ),
          
        ],
      ),
    );
  }
}