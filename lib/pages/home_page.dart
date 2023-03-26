import 'package:flutter/material.dart';
import 'package:tutorial_1/models/catalog.dart';
import 'package:tutorial_1/widgets/drawer.dart';
import 'package:tutorial_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days = 30;

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.item[0]);

    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          //itemCount: CatalogModel.item.length,
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget( 
              //item: CatalogModel.item[index],
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
