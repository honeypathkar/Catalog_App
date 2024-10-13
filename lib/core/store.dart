// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModels catalog;
  late CartModel cart;

  MyStore() {
    // Initialize catalog and cart objects
    catalog = CatalogModels();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
