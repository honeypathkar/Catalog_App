import 'package:flutter/material.dart';
import 'package:shopping_cart/core/store.dart';
import 'package:shopping_cart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../widgets/theme.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;

    // Using VxBuilder to listen for changes in the CartModel state
    return VxBuilder(
      mutations: const {AddMutation, RemoveMutation},
      builder: (context, _, __) {
        bool isInCart = _cart.items.contains(catalog);
        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog);
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(MyTheme.darkBluishColor),
            shape: WidgetStateProperty.all(const StadiumBorder()),
          ),
          child: isInCart
              ? const Icon(Icons.done, color: Colors.white)
              : const Icon(Icons.add_shopping_cart_outlined,
                  color: Colors.white),
        );
      },
    );
  }
}
