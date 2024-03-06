import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Common/selection_bagde_widget.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/AllBadges/Controller/all_badges_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/AllBadges/State/all_badges_state.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Badges/ShowExpertProfiles/show_expert_profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBBadgesScreen extends StatefulWidget {
  const AllBBadgesScreen({super.key, this.type, this.businessId});

  final String? type;
  final String? businessId;

  @override
  State<AllBBadgesScreen> createState() => _AllBBadgesScreenState();
}

class _AllBBadgesScreenState extends State<AllBBadgesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AllBadgesCubit>().getBadges(type: widget.type);
  }

  String? selectedId;

  @override
  Widget build(BuildContext context) {
    print(widget.businessId);

    return Scaffold(
      appBar: AppBar(
        leading: widget.type == "seller"
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(left: 20.0.sp),
                child: const BackArrowWidget(),
              ),
        // automaticallyImplyLeading: false,
        actions: [
          widget.type == "seller"
              ? Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const BottomNavigationScreen(
                            initialPage: 0,
                          );
                        },
                      ));
                    },
                    child: AppText(
                      'Skip',
                      style: Styles.circularStdBold(
                        context,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              : 10.x,
        ],
      ),
      body: BlocConsumer<AllBadgesCubit, AllBadgesState>(
        listener: (context, state) {
          if (state is AllBadgesLoadingState) {
            LoadingDialog.showLoadingDialog(context);
          }
          if (state is AllBadgesErrorState) {
            Navigator.pop(context);
            WidgetFunctions.instance
                .showErrorSnackBar(context: context, error: state.error);
          }

          if (state is AllBadgesLoadedState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: AppText(
                'Badges',
                style: Styles.circularStdBold(
                  context,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: AppText(
                'You can select multiple badges from here to increase the chance of sale.',
                maxLine: 3,
                style: Styles.circularStdRegular(context,
                    color: AppColors.lightGreyColor),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: context.read<AllBadgesCubit>().badges.length,
                padding: const EdgeInsets.only(
                    bottom: 20, left: 20, right: 20, top: 30),
                itemBuilder: (BuildContext context, int index) {
                  final data = context.read<AllBadgesCubit>().badges;

                  return BadgeSelectionWidget(
                    model: data[index],
                    isSelected: context
                        .read<AllBadgesCubit>()
                        .checkSelection(data[index].id),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ShowTheExpertProfiles(
                            badgesModel: data[index],
                            businessId: widget.businessId,
                            type: widget.type,
                          );
                        },
                      ));
                      // context
                      //     .read<AllBadgesCubit>()
                      //     .toggleSelection(data[index].id);
                    },
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 100,
                  crossAxisCount: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
