import 'package:flutter/material.dart';
import 'package:vir/core/component/image_widget.dart';
import 'package:vir/core/component/sizebox_widget.dart';
import 'package:vir/core/key/image_keys.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return   const CustomSizeBox(width: 200,height: 115,child:  ImageWidget(path: ImageStrings.appLogo,));
  }
}