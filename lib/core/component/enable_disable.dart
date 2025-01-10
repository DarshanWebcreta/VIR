import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:vir/core/component/custom_checkBox.dart';
import 'package:vir/core/component/text_widget.dart';
import 'package:vir/core/utils/font_size.dart';

class EnableDisableStatus extends StatelessWidget {
  const EnableDisableStatus({
    super.key,
    required this.callback,
    required this.enable
  });
  final bool enable;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(text: "Status*",fontWeight: FontWeight.w600,fontSize: 12,).paddingOnly(top: 4.h),
        CheckBoxWidget(fontSize: FontSizes.mediuam,size: 20,label: "Enable",value:enable , callback: callback,).paddingOnly(top: 6.h),
      ],
    );
  }
}