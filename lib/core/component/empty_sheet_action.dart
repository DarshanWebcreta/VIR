

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vir/core/common/empty_widget.dart';


class EmptySheetAction extends StatelessWidget {
  final String btnTxt;
  final VoidCallback callback;
  const EmptySheetAction({
    super.key,
    required this.callback,
    required this.btnTxt
  });

  @override
  Widget build(BuildContext context) {
    return EmptyWidget(error: true,callbackAction:
    callback,btnTxt: "Add $btnTxt",description: "No $btnTxt added , please add any $btnTxt!",title: btnTxt.capitalizeFirst!);
  }
}