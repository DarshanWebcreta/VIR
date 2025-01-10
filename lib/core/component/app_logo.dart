import 'package:flutter/material.dart';
import 'package:vir/core/component/image_widget.dart';
import 'package:vir/core/key/image_keys.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return   const ImageWidget(path: ImageStrings.appLogo,);
  }
}