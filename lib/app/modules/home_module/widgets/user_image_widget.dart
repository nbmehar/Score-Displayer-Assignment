import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../home_controller.dart';

class UserImageWidget extends StatelessWidget {

  final HomeController gxValues;

  UserImageWidget(this.gxValues);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: gxValues.userModel.imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: imageProvider, fit: BoxFit.fill),
        ),
      ),
      placeholder: (context, url) => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: Icon(Icons.error),
      ),
    );
  }
}