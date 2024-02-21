import 'dart:io';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/add_business_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/BottomNavigation/Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Components/add_business_success_diolog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_controller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/Controller/add_business_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PublishWidget extends StatefulWidget {
  const PublishWidget({super.key});

  @override
  State<PublishWidget> createState() => _PublishWidgetState();
}

class _PublishWidgetState extends State<PublishWidget> {
  List<String?>? images;

  bool valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       bottomNavigationBar: CustomButton(
//         onTap: () async {
//
//
// CustomDialog.dialog(context, const AddSuccessDialog(),barrierDismissible: false);
// await Future.delayed(const Duration(seconds: 3));
//         Navigate.pop(context);
//         Navigate.pop(context);
//
//       },
//         borderRadius: 30,
//         height: 56,
//         text: 'Publish' ,),
      body: BlocConsumer<AddBusinessCubit, AddBusinessState>(
        listener: (context, state) {
          print(state.toString());

          if (state is AddBusinessLoading) {
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is AddBusinessLoaded) {
            Navigator.pop(context);
            CustomDialog.dialog(context, const AddSuccessDialog(),
                barrierDismissible: false);
            Future.delayed(const Duration(microseconds: 20));
            BottomNotifier.bottomPageController!.jumpToPage(0);
            Navigator.pop(context);
            Navigator.pop(context);
          }
          if (state is AddBusinessError) {
            Navigator.pop(context);
            WidgetFunctions.instance
                .showErrorSnackBar(context: context, error: state.error);
          }

          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  30.y,
                  20.y,
                  AppText('Upload image',
                      style: Styles.circularStdMedium(context, fontSize: 20)),
                  10.y,
                  AddImageWidget(
                    addText: "Uploads photos",
                    onTap: () async {
                      images = await PickFile.pickImage();
                      valid = false;
                      setState(() {});
                    },
                  ),
                  10.y,
                  AppText('At least 1 photos to improve check for sale',
                      style: Styles.circularStdRegular(context,
                          color: const Color(0xFFB0B0B0), fontSize: 14)),
                  AppText('Should be jpg, png, git format only',
                      style: Styles.circularStdRegular(context,
                          color: const Color(0xFFB0B0B0), fontSize: 14)),

                  images != null
                      ? valid == false
                          ? SizedBox(
                              height: 100.h,
                              width: 1.sw,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: images!.length,
                                itemBuilder: (context, index) {
                                  return DisplayFileImage(
                                    fileImage: images![index].toString(),
                                    onDeleteTap: () {
                                      setState(() {
                                        images!.removeAt(index);
                                        //image = [];
                                      });
                                    },
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 5.sp,
                                  );
                                },
                              ),
                            )
                          : const SizedBox()
                      : const SizedBox.shrink(),
                  valid
                      ? AppText('Image Required',
                          style: Styles.circularStdRegular(context,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.redColor))
                      : 10.x,

                  const Spacer(),
                  const Spacer()
                ],
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: CustomButton(
                  onTap: () async {
                    if (images == null || images!.isEmpty) {
                      valid = true;
                      setState(() {});
                    } else {
                      valid = false;
                      setState(() {});
                      _sendData();
                    }
                  },
                  textFontWeight: FontWeight.w500,
                  borderRadius: 30,
                  height: 56,
                  width: 1.sw / 1.25,
                  text: 'Publish',
                ),
              )
            ],
          );
        },
      ),
    );
  }

  _sendData() {
    AddBusinessModel currentModel = AddBusinessController.addBusiness.value;

    Map<String, dynamic> mapData =
        AddBusinessController.addBusiness.value.toJson();

    print("this the map data in json ${mapData.toString()}");

    context.read<AddBusinessCubit>().addBusiness(
          body: mapData,
          images: images!,
          files: currentModel.documnets,
        );
  }
}
