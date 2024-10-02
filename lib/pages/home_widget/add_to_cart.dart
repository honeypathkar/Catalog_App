import 'package:flutter/material.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../widgets/theme.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  // ignore: unused_field
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          // ignore: no_leading_underscores_for_local_identifiers
          final _catalog = CatalogModels();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          MyTheme.darkBluishColor,
        ),
        shape: WidgetStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : const Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
    );
  }
}
