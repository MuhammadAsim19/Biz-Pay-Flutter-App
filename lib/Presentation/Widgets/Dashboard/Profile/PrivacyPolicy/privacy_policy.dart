import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/PrivacyAndPolicy/privacy_model.dart';

import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/privacy_shimmer.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/saved_loading.dart';

import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/PrivacyPolicy/Controller/privacy_policy_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/PrivacyPolicy/State/privacy_policy_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    context.read<PrivacyPolicyCubit>().getPrivacyPolicyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.privacyPolicy,
          leading: true,
        ),
        body: BlocConsumer<PrivacyPolicyCubit, PrivacyPolicyState>(
          listener: (context, state) {
            if (state is PrivacyPolicyError) {
              Navigator.pop(context);
              WidgetFunctions.instance.snackBar(context,
                  bgColor: AppColors.primaryColor, text: state.error);
            }
          },
          builder: (context, state) {
            return state is PrivacyPolicyLoaded
                ? ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5.h,
                      );
                    },
                    itemCount: state.privacyModel!.length,
                    itemBuilder: (context, index) {
                      final data = state.privacyModel![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildPrivacyPolicyItem(data),
                          ],
                        ),
                      );
                    })
                : state is PrivacyPolicyLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: PrivacyPolicyShimmer(),
                      )
                    : state is PrivacyPolicyError
                        ? Center(
                            child: AppText(
                              state.error!,
                              style: Styles.circularStdRegular(context),
                            ),
                          )
                        : const SizedBox.shrink();
          },
        ));
  }

  Widget buildPrivacyPolicyItem(PrivacyPolicyModel? data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          data!.title ?? "",
          style: Styles.circularStdBold(context, fontSize: 14.sp),
        ),
        AppText(
          data.description ?? "",
          maxLine: 5,
          style: Styles.circularStdRegular(context, fontSize: 14.sp),
        ),
        const SizedBox(height: 6),
        ...data.points?.map((point) => buildPoint(point)).toList() ?? [],
      ],
    );
  }

  Widget buildPoint(Point point) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          point.title ?? "",
          style: Styles.circularStdBold(context),
        ),
        AppText(
          point.description ?? "",
          maxLine: 5,
          style: Styles.circularStdRegular(context, fontSize: 14.sp),
        ),
        const SizedBox(height: 6),
        ...point.list
                ?.map((listElement) => buildListElement(listElement))
                .toList() ??
            [],
      ],
    );
  }

  Widget buildListElement(ListElement listElement) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          listElement.title ?? "",
          style: Styles.circularStdBold(context),
        ),
        AppText(
          listElement.icon ?? "",
          style: Styles.circularStdBold(context),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
