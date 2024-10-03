import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";


class ProductItem extends StatelessWidget{

  final String imgSrc;
  final String productName;
  final String currentPrice;
  final String beforePrice;
  final String categoty;
  final String tag;
  final int id;

  ProductItem({
    required this.imgSrc,
    required this.productName,
    required this.currentPrice,
    required this.beforePrice,
    required this.categoty,
    required this.tag,
    required this.id,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10.0,),
        CachedNetworkImage(
          imageUrl: imgSrc,
          placeholder: (context, url) => const SizedBox(
            width: 64.0,
            height: 64.0,
            child: CircularProgressIndicator(strokeWidth: 2.0),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 64.0,
          height: 64.0,
        ),
        const Spacer(),
        Expanded(
          flex: 1,
          child: Text(productName, style: const TextStyle(color: Color.fromRGBO(73, 80, 87, 1.0)),),
        ),
        Expanded(
          flex: 1,
          child: Text("$id", style: const TextStyle(color: Color.fromRGBO(73, 80, 87, 1.0)),),
        ),
        Expanded(
          flex: 1,
          child: Text("$beforePrice/$currentPrice", style: const TextStyle(color: Color.fromRGBO(73, 80, 87, 1.0)),),
        ),
        Expanded(
          flex: 1,
          child: Text(categoty, style: const TextStyle(color: Color.fromRGBO(73, 80, 87, 1.0)),),
        ),
        Expanded(
          flex: 1,
          child: Text(tag, style: const TextStyle(color: Color.fromRGBO(73, 80, 87, 1.0)),),
        ),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.auto_fix_high),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
    );
  }
}