import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('Your Cart'),
    );
    // final appBarSize = appBar.preferredSize.height;
    // final paddingSize = MediaQuery.of(context).padding.top;
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            Container(
              child: Card(
                margin: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('total', style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Chip(
                          label: Text(
                            '\$${cart.totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6
                                    .color),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        FlatButton(
                          onPressed: () {
                            final orderCls = Provider.of<Orders>(context, listen: false);
                            orderCls.addOrder(
                              cart.items.values.toList(),
                              cart.totalAmount,
                            );
                            cart.clear();
                          },
                          child: Text('Place order'),
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ]),
                ),
              ),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartItem(
                  id: cart.items.values.toList()[i].id,
                  productId: cart.items.keys.toList()[i],
                  title: cart.items.values.toList()[i].title,
                  quantity: cart.items.values.toList()[i].quantity,
                  price: cart.items.values.toList()[i].price,
                ),
              ),
            )
          ],
        ));
  }
}
