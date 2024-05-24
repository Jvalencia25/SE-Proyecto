import 'package:erp_reposteria/catalogue_responsive/catalogue_desktop_scaffold.dart';
import 'package:erp_reposteria/catalogue_responsive/catalogue_responsive_layout.dart';
import 'package:erp_reposteria/constants.dart';
import 'package:erp_reposteria/inventory_responsive/inventory_desktop_scaffold.dart';
import 'package:erp_reposteria/inventory_responsive/inventory_responsive_layout.dart';
import 'package:erp_reposteria/order_responsive/order_desktop_scaffold.dart';
import 'package:erp_reposteria/order_responsive/order_responsive_layout.dart';
import 'package:erp_reposteria/register_responsive/register_desktop_scaffold.dart';
import 'package:erp_reposteria/register_responsive/register_responsive_layout.dart';
import 'package:erp_reposteria/util/my_box.dart';
import 'package:erp_reposteria/util/my_box_data.dart';
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
      drawer: Builder(
        builder: (BuildContext context) {
        return buildDrawer(context);
    },
  ),
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
              final boxData = myBoxData[index];
              return MyBox(
                text: boxData.text,
                imageUrl: boxData.imageUrl, 
                onTap: () {
                  Widget targetScreen;
                  switch(index){
                    case 0:
                      targetScreen = InventoryResponsiveLayout(
                        desktopScaffold: InventoryDesktopScaffold(),
                      );
                      break;
                    case 1:
                      targetScreen = CatalogueResponsiveLayout(
                        desktopScaffold: CatalogueDesktopScaffold(),
                      );
                      break;
                    case 2:
                      targetScreen = OrderResponsiveLayout(
                        desktopScaffold: OrderDesktopScaffold(),
                      );
                      break;
                    case 3:
                      targetScreen = RegisterResponsiveLayout(
                        desktopScaffold: RegisterDesktopScaffold(),
                      );
                      break;
                    default:
                      targetScreen = InventoryResponsiveLayout(
                        desktopScaffold: InventoryDesktopScaffold(),
                      );
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
                },
              );
            }),
            ),
            ),
          ),
          
        ],
      ),
    );
  }
}