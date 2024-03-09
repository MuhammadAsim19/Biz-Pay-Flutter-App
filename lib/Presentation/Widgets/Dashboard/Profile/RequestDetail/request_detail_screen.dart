import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Badges/BadgesRequest/badges_request.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/Controller/download_file.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/Common/badge_general_data_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/Common/note_attachment_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/Controller/acceptAndRejectRequest.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/Controller/request_detail_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Controller/get_all_badges_request_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/RequestDetail/State/request_detail_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'State/acceptAndRejectRequest_state.dart';

class RequestDetailScreen extends StatefulWidget {
  final BadgesRequest badges;
  final bool isFromBusiness;

  const RequestDetailScreen(
      {super.key, required this.badges, required this.isFromBusiness});

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
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
              RequestGeneralDataWidget(badgesRequest: widget.badges),
              12.y,
              if (widget.badges.status == "delivered")
                NoteAndAttachmentWidget(
                    noteTitle: 'Expert note',
                    note: widget.badges.message ?? '',
                    attachmentTitle: 'Expert Delivery',
                    attachment: widget.badges.delivery?.attachment),
              12.y,
              if (!widget.isFromBusiness && widget.badges.status == "accepted")
                CustomTextFieldWithOnTap(
                  controller: controller,
                  hintText: 'Message',
                  textInputType: TextInputType.text,
                  maxline: 5,
                ),
              20.y,
              if (!widget.isFromBusiness && widget.badges.status == "accepted")
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
                  text: 'Your Uploads Documents',
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
              20.y,
              if (widget.isFromBusiness && widget.badges.status == "delivered")
                BlocListener<AcceptAndRejectRequestCubit,
                    AcceptAndRejectRequestState>(
                  listener: (context, state) {
                    if (state is AcceptAndRejectRequestStateLoading) {
                      LoadingDialog.showLoadingDialog(context);
                    }
                    if (state is AcceptAndRejectRequestStateLoaded) {
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                      context
                          .read<AllBadgesRequestCubit>()
                          .getBadgesRequest(isBroker: !widget.isFromBusiness);
                    }
                    if (state is AcceptAndRejectRequestStateError) {
                      WidgetFunctions.instance
                          .snackBar(context, text: state.error);
                    }
                    // TODO: implement listener
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          horizontalPadding: 20.sp,
                          onTap: () {
                            context
                                .read<AcceptAndRejectRequestCubit>()
                                .acceptRequest(
                                    status: "accept",
                                    requestId: widget.badges.id);
                          },
                          text: "Accept"),
                      CustomButton(
                          horizontalPadding: 20.sp,
                          bgColor: AppColors.whiteColor,
                          borderColor: AppColors.blackColor,
                          textColor: AppColors.blackColor,
                          onTap: () {
                            context
                                .read<AcceptAndRejectRequestCubit>()
                                .acceptRequest(
                                    status: "reject",
                                    requestId: widget.badges.id);
                          },
                          text: "Reject"),
                    ],
                  ),
                ),
              if (!widget.isFromBusiness)
                if (!widget.isFromBusiness &&
                    widget.badges.status == "accepted")
                  BlocListener<RequestDetailCubit, RequestDetailState>(
                    listener: (context, state) {
                      if (state is RequestDetailLoading) {
                        LoadingDialog.showLoadingDialog(context);
                      }
                      if (state is RequestDetailLoaded) {
                        context
                            .read<AllBadgesRequestCubit>()
                            .getBadgesRequest(isBroker: true);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }
                      if (state is RequestDetailError) {
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
                                context.read<RequestDetailCubit>().addDelivery(
                                    path: upload!.path, data: data);
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
