import 'package:erp_reposteria/constants.dart';
import 'package:erp_reposteria/util/my_box.dart';
import 'package:erp_reposteria/util/my_box_data.dart';
import 'package:flutter/material.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      backgroundColor: MyDefaultBackround,
      body: Row(children: [
        MyDrawer,
        Expanded(child: Column(
        children: [
          //4 box on the top
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
            child: SizedBox(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: 
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
            itemBuilder: (context,index){
              final boxData = myBoxData[index];
              return MyBox(
                text: boxData.text,
                imageUrl: boxData.imageUrl, 
                onTap: () {  },
              );
            }),
            ),
            ),
          ),
          
        ],
      ),)
      ],),
      
    );
  }
}