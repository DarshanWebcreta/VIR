//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vir/core/component/image_widget.dart';
// import 'package:vir/core/key/image_keys.dart';
// import 'package:vir/core/theme/app_colors.dart';
//
// class NetworkImageWidget extends StatelessWidget {
//   final double radius;
//   final String path;
//
//   const NetworkImageWidget({super.key,required this.path,this.radius = 8});
//
//   @override
//   Widget build(BuildContext context) {
//     return  CachedNetworkImage(
//       imageUrl: path,
//       imageBuilder: (context, imageProvider) => Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(radius.r),
//           image: DecorationImage(
//             image: imageProvider,
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//       placeholder: (context, url) => Center(
//         child: SizedBox(
//           width: 20.0.w,
//           height: 20.0.w,
//           child: const CircularProgressIndicator(
//             color: AppColors.themeColor,
//             strokeWidth: 2,
//           ),
//         ),
//       ),
//       errorWidget: (context, url, error) => Center(child: SizedBox(height: 50.h,width: 50.w,child:const ImageWidget(path:ImageStrings.appLogo)  ,)),
//
//
//     );
//   }
// }
