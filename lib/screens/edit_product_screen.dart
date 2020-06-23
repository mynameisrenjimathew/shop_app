import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  static const routeName = '/edit_product';
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final priceFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final imageUrlController = TextEditingController();

  @override
  void dispose() {
    priceFocusNode.dispose();
    descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(priceFocusNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'price'),
                textInputAction: TextInputAction.next,
                focusNode: priceFocusNode,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                focusNode: descriptionFocusNode,
                onFieldSubmitted: (_) {
                  // FocusScope.of(context).requestFocus(priceFocusNode);
                },
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              // Row(
              //   children: <Widget>[
              //     Container(
              //       margin: EdgeInsets.only(top: 8, right: 10),
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           width: 1,
              //           color: Colors.grey,
              //         ),
              //       ),
              //       child: ,
              //     ),
              //     TextFormField(
              //       decoration: InputDecoration(labelText: 'Image Url'),
              //       keyboardType: TextInputType.url,
              //       textInputAction: TextInputAction.done,
              //       controller: imageUrlController,
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
