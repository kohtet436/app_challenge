import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  final String image;
  final String name;
  final String productType;
  final String price;
  const ProductsWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.productType,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 120.0),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            CachedNetworkImage(
              imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                      strokeWidth: 2, value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              name,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            Text(productType),
            Text(
              "\$ $price",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
