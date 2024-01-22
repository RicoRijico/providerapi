import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/providers/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 Provider.of<ProductProvider>(context,listen: false).products;
  }
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider API"),
      ),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(product[index].title.toString()),
            subtitle: Text(product[index].body.toString()),

          );
        },
      )
    );
  }
}
