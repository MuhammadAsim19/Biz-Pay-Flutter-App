import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/DataSource/Resources/strings.dart';
import 'package:buysellbiz/Data/DataSource/Resources/validator.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/add_image_widget.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Common/custom_dropdown.dart';
import 'package:buysellbiz/Presentation/Common/custom_textfield_with_on_tap.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Common/display_images.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Controller/CustomerSupport/customer_support_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:buysellbiz/Application/Services/PickerServices/picker_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  TextEditingController helpController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController remarkController = TextEditingController();

  List how = ['Admin', "Business Owner", 'New Seller'];

  String? ho;

  final _formKey = GlobalKey<FormState>();

  bool imageValid = false;
  List<String?>? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(
        title: AppStrings.customerSupport,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.y,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropDownWidget(
                      hMargin: 0,
                      vMargin: 0,
                      value: ho,
                      itemsMap: how.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (onChanged) {
                        helpController.text = onChanged.toString();
                      },
                      prefixIcon: SvgPicture.asset(Assets.person),
                      hintText: 'How can we help you?',
                      validationText: 'Section Required',
                    ),
                    10.y,
                    CustomTextFieldWithOnTap(
                        validateText: 'Name Required',
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.profile),
                        controller: nameController,
                        hintText: 'Name',
                        textInputType: TextInputType.name),
                    CustomTextFieldWithOnTap(
                        validator: Validate.email,
                        borderRadius: 40.r,
                        prefixIcon: SvgPicture.asset(Assets.message),
                        controller: emailController,
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress),
                    CustomTextFieldWithOnTap(
                        validateText: 'Field Required',
                        height: 100.h,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.sp, horizontal: 10.sp),
                        maxline: 5,
                        borderRadius: 10.r,
                        controller: remarkController,
                        hintText: 'Remark',
                        textInputType: TextInputType.emailAddress),
                  ],
                ),
              ),

// 189.y,
              35.y,

              AddImageWidget(
                  height: 66.h,
                  width: 142.w,
                  text: 'Upload Attachment',
                  onTap: () async {
                    images = await PickFile.pickImage();
                    imageValid = false;
                    setState(() {});
                  }),

              10.y,
              images != null
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
                                if (images!.isEmpty) {
                                  setState(() {
                                    images = null;
                                  });
                                }
                                //image = [];
                              });
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 5.sp,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
              5.y,
              imageValid == true
                  ? AppText('Image Required',
                      style: Styles.circularStdRegular(context,
                          fontSize: 12.sp,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.w400))
                  : 10.x,

              50.y,
              //const Spacer(),
              BlocListener<CustomerSupportCubit, CustomerSupportState>(
                listener: (context, state) {
                  if (state is CustomerSupportLoading) {
                    LoadingDialog.showLoadingDialog(context);
                  }
                  if (state is CustomerSupportLoaded) {
                    Navigator.pop(context);
                  }
                  if (state is CustomerSupportError) {
                    Navigator.pop(context);
                    WidgetFunctions.instance.showErrorSnackBar(
                        context: context, error: state.error);
                    CustomDialog.successDialog(context,
                        title: 'FedBack Added',
                        message: 'Your FedBack Added SuccessFul');
                    Navigator.pop(context);
                  }
                  // TODO: implement listener
                },
                child: CustomButton(
                  gapWidth: 7.w,
                  imageHeight: 20.h,
                  imageWidth: 20.w,
                  leadingSvgIcon: true,
                  width: 320.w,
                  borderRadius: 40.r,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (images != null) {
                        if (images!.isNotEmpty) {
                          _send();
                          imageValid = false;
                          setState(() {});
                        } else {
                          imageValid = true;
                          setState(() {});
                        }
                      } else {
                        imageValid = true;
                        setState(() {});
                      }
                    }
                  },
                  text: AppStrings.submit,
                  bgColor: AppColors.primaryColor,
                  textFontWeight: FontWeight.w700,
                  textSize: 16.sp,
                  textColor: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _send() {
    var data = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'type': helpController.text.trim(),
      'issue': remarkController.text.trim(),
    };

    context.read<CustomerSupportCubit>().addIssue(body: data, images: images);

    nameController.clear();
    emailController.clear();
    helpController.clear();
    remarkController.clear();
    images = null;
    setState(() {});
  }
}
