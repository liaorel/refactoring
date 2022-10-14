import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final String image;
  const PhotoCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Image.network(image, width: 100, height: 100, fit: BoxFit.cover,),
    );
  }
}
