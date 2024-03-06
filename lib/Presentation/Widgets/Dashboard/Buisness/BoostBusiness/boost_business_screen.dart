import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/BusinessModel/boost_model.dart';
import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/app_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BoostBusiness/Common/boost_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BoostBusiness/Controller/business_boost_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BoostBusiness/State/business_boost_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoostBusinessScreen extends StatefulWidget {
  const BoostBusinessScreen({super.key, required this.model});
  final BusinessModel model;
  @override
  State<BoostBusinessScreen> createState() => _BoostBusinessScreenState();
}

class _BoostBusinessScreenState extends State<BoostBusinessScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BusinessBoostCubit>().getPackages();
  }

  List<BoostModel> packages = [];
  BoostModel? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Boost your Business',
        leading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: AppText(
              'You can boost your business to reach out your possible buyer',
              maxLine: 3,
              style: Styles.circularStdRegular(context, fontSize: 14),
            ),
          ),
          const Divider(height: 1),
          BlocConsumer<BusinessBoostCubit, BusinessBoostState>(
            listener: (BuildContext context, BusinessBoostState state) {
              if (state is BusinessBoostLoadingState) {
                LoadingDialog.showLoadingDialog(context);
              }
              if (state is BusinessBoostErrorState) {
                Navigator.pop(context);
                WidgetFunctions.instance
                    .showErrorSnackBar(context: context, error: state.error);
              }

              if (state is BusinessBoostLoadedState) {
                packages = state.boostPackages;
                Navigator.pop(context);
              }
              if (state is BusinessBoostActivatedState) {
                Navigator.pop(context);
                // Navigator.pop(context);
              }
            },
            builder: (BuildContext context, BusinessBoostState state) =>
                packages.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: packages.length,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 100, top: 30),
                          itemBuilder: (context, index) => BoostTile(
                            model: packages[index],
                            isSelected: selected?.id == packages[index].id,
                            onTap: () {
                              setState(() {
                                selected = packages[index];
                              });
                            },
                          ),
                        ),
                      )
                    : const SizedBox(),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButton(
        horizontalMargin: 20,
        verticalMargin: 20,
        onTap: () {
          if (selected != null) {
            context.read<BusinessBoostCubit>().activateBoost(
                  planId: selected?.id ?? '',
                  businessId: widget.model.id ?? '',
                  context: context,
                );
          } else {
            WidgetFunctions.instance.showErrorSnackBar(
                context: context, error: 'Select a boost package to continue');
          }
        },
        text: 'Continue',
      ),
    );
  }
}
