
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
import 'package:vir/features/subject/presentation/store/subject_store.dart';
import 'package:vir/injection.dart';


class SubjectList extends StatefulWidget {
  const SubjectList({super.key});

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  final subject = getIt<SubjectStore>();

  @override
  void initState() {
    subject.getSubjectList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.subjectListTitle,
        backBtn: true,
      ),
      body: Column(
        children: [
          AddNewButton(
            onPress: () {
              Get.toNamed(RoutesNames.subjectView);

            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => subject.getSubjectList(),
              child: Observer(builder: (context) {
                if(subject.isLoading){
                  return const ListShimmerEffect();

                }
                else{
                  return  subject.subjectList.isEmpty
                      ? const EmptyWidget(title: "Category")
                      :ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    itemCount: subject.subjectList.length,
                    itemBuilder: (context, index) {
                      final subjectData = subject.subjectList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesNames.subjectView,arguments: subjectData);
                        },
                        child:    StatusCard(id: subjectData.id.toString(),title:  subjectData.name,status:subjectData.status,deletePress: () {
                          subject.deleteSubject(subjectData.id);
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






