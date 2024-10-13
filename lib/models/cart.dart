import 'package:shopping_cart/core/store.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  late CatalogModels _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModels get catalog => _catalog;

  set catalog(CatalogModels newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item?> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current!.price);

  //Add item function
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove iten function
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

//AddMutaion function
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart.add(item);
  }
}
