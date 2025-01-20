
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vir/core/common/empty_widget.dart';
import 'package:vir/core/component/add_new_button.dart';
import 'package:vir/core/component/custom_appbar.dart';
import 'package:vir/core/component/list_shimmer_effect.dart';

import 'package:vir/core/constant/app_strings.dart';
import 'package:vir/core/routes/route_name.dart';
import 'package:vir/core/utils/fix_sizes.dart';
import 'package:vir/features/category/presentation/store/category_store.dart';
import 'package:vir/features/master/presentation/widget/status_card.dart';
import 'package:vir/injection.dart';


class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final category = getIt<CategoryStore>();

  @override
  void initState() {
    category.getCategoryList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.categoryListTitle,
        backBtn: true,
      ),
      body: Column(
        children: [
          AddNewButton(
            onPress: () {
              Get.toNamed(RoutesNames.categoryView);

            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh:() => category.getCategoryList() ,
              child: Observer(builder: (context) {
                if(category.isLoading){
                  return const ListShimmerEffect();

                }
                else{
                  return    category.categoryList.isEmpty
                      ? const EmptyWidget(title: "Category")
                      :ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    itemCount: category.categoryList.length,
                    itemBuilder: (context, index) {
                      final categoryData = category.categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesNames.categoryView,arguments: categoryData);
                        },
                        child:    StatusCard(id: categoryData.id.toString(),title:  categoryData.name,status:categoryData.status,deletePress: () {
                          category.deleteCategory(categoryData.id);
                        }, ).paddingOnly(bottom: 6.h)
                        ,
                      );
                    },
                  );
                }
              },),
            ),
          )
        ],
      ).paddingAll(FixSizes.paddingAllAndHorizontol),
    );
  }
}






