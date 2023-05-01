import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  "Verify Mobile Number",
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
