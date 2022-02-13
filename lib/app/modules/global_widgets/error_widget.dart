import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {

  final String error;
  CustomErrorWidget(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}
