import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
class SpinKitItem extends StatelessWidget {
  const SpinKitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(color: Theme.of(context).primaryColor,);
  }
}
