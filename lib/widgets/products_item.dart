import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // ProductItem({
  //   @required this.id,
  //   @required this.title,
  //   @required this.imageUrl,
  // });
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context);
    final cartProduct = Provider.of<Cart>(context);
    return Consumer<Product>(
        builder: (ctx, product, child) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: product.id);
                  },
                  child: Hero(
                    tag: product.id,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/original.png'),
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.network(
                  //   product.imageUrl,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                        icon: Icon(product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
                        onPressed: () {
                          product.toggleFavoriteStatus();
                        },
                        color: Theme.of(context).accentColor),
                    title: Text(
                      product.title,
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        cartProduct.addItem(
                          product.id,
                          product.price,
                          product.title,
                        );
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Item added to cart!!'),
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  cartProduct.removeSingleItem(product.id);
                                }),
                          ),
                        );
                      },
                      color: Theme.of(context).accentColor,
                    )),
              ),
            ));
  }
}
