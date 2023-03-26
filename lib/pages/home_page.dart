import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial_1/models/catalog.dart';
import 'package:tutorial_1/widgets/drawer.dart';
import 'package:tutorial_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData['products'];
    CatalogModel.item = List.from(productData)
        .map<Item>(
          (item) => Item.fromMap(item),
        )
        .toList();
    print(productData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(50, (index) => CatalogModel.item[0]);

    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.item.length,
                //itemCount: dummyList.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.item[index],
                    //item: dummyList[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
