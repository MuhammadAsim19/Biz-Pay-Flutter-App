import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Controller/add_delivery_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Controller/get_all_badges_request_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDelivery extends StatefulWidget {
  final BadgesRequest? badges;

  const AddDelivery({super.key, this.badges});

  @override
  State<AddDelivery> createState() => _AddDeliveryState();
}

class _AddDeliveryState extends State<AddDelivery> {
  PlatformFile? upload;

  TextEditingController controller = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText("${widget.badges?.badgeReff?.title}",
                style: Styles.circularStdMedium(context, fontSize: 18.sp)),
            20.x,
          ],
        ),
        centerTitle: true,
        leadingWidth: 48.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.sp),
          child: const BackArrowWidget(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('Business Name ',
                  style: Styles.circularStdMedium(context, fontSize: 18)),
              4.y,
              // AppText('Order Number : #11391s302',
              //     style: Styles.circularStdRegular(context,
              //         fontSize: 16, color: AppColors.greyTextColor)),
              4.y,
              Row(
                children: [
                  AppText('Order for badge type : ',
                      style: Styles.circularStdMedium(context, fontSize: 16)),
                  AppText('Limousine',
                      style: Styles.circularStdRegular(context,
                          fontSize: 16.sp, color: AppColors.greyTextColor)),
                ],
              ),
              4.y,
              Row(
                children: [
                  AppText('Order time : ',
                      style:
                          Styles.circularStdMedium(context, fontSize: 16.sp)),
                  AppText('2 days Ago',
                      style: Styles.circularStdRegular(context,
                          fontSize: 14.sp, color: AppColors.greyTextColor)),
                  const Spacer(),
                  CustomButton(
                      height: 38,
                      width: 70,
                      onTap: () {},
                      text: 'Chat',
                      borderRadius: 25,
                      textSize: 13),
                ],
              ),
              15.y,
              AddImageWidget(
                attachFile: Assets.uploadAttachment,
                onTap: () async {
                  var pickedFile = await PickFile.pickFiles();
                  if (pickedFile != null) {
                    upload = pickedFile;
                    setState(() {});
                  }
                },
                height: 82,
                width: 400.w,
                text: 'Upload Documents',
              ),
              upload != null
                  ? DisplayFile(
                      file: upload,
                      onDeleteTap: () {
                        upload = null;
                        setState(() {});
                      },
                      index: 0,
                    )
                  : 10.x,
              10.y,
              CustomTextFieldWithOnTap(
                  maxline: 5,
                  controller: controller,
                  hintText: "Write Description",
                  validateText: 'Description Required',
                  textInputType: TextInputType.text),
              20.y,
              BlocListener<AddDeliveryCubit, AddDeliveryState>(
                listener: (context, state) {
                  if (state is AddDeliveryLoading) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is AddDeliveryLoaded) {
                    context
                        .read<AllBadgesRequestCubit>()
                        .getBadgesRequest(isBroker: true);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                  if (state is AddDeliveryError) {
                    WidgetFunctions.instance
                        .snackBar(context, text: state.error);
                  }
                  // TODO: implement listener
                },
                child: CustomButton(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        if (upload != null) {
                          if (upload!.path!.contains(".pdf")) {
                            var data = {
                              "message": controller.text.trim(),
                              "badgeReqestId": widget.badges!.id,
                            };
                            context
                                .read<AddDeliveryCubit>()
                                .addDelivery(path: upload!.path, data: data);
                          } else {
                            WidgetFunctions.instance.snackBar(context,
                                text: 'File type is not correct');
                          }
                        } else {
                          WidgetFunctions.instance
                              .snackBar(context, text: 'Document Required');
                        }
                      }
                    },
                    text: "Add Delivery"),
              ),
              20.y,
            ],
          ),
        ),
      ),
    );
  }
}
