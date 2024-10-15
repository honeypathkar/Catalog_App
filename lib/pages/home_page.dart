import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_cart/core/store.dart';
import 'package:shopping_cart/models/cart.dart';
import 'dart:convert';
import 'package:shopping_cart/models/catalog.dart';
import 'package:shopping_cart/pages/home_widget/catalog_header.dart';
import 'package:shopping_cart/pages/home_widget/catalog_list.dart';
import 'package:shopping_cart/utils/myroute.dart';
import 'package:shopping_cart/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url = "https://fakestoreapi.com/products";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    /*  final response = await http.get(Uri.parse(url));
    final catalogJson = response.body; */
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, __) {
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoute.cartRoute),
            backgroundColor: MyTheme.darkBluishColor,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ).badge(
            color: Vx.gray200,
            size: 22,
            count:
                _cart.items.length, // Ensure _cart is properly defined and used
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModels.items != null &&
                  CatalogModels.items!.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
