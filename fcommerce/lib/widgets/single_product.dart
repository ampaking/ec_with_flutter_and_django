import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final int? id;
  final String? title;
  final String? image;
  final bool? isFavorite;

  const SingleProduct(
      {this.title, this.id, this.image, this.isFavorite, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        "http://192.168.11.7:8000$image",
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          title!,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: isFavorite!
              ? Icon(
                  Icons.favorite,
                )
              : Icon(Icons.favorite_border),
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
