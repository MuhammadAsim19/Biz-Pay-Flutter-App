import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/BadgesRequests/Controller/get_all_badges_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Components/ongoing_orders_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Components/pending_requests_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Components/tab_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportDashBoard extends StatefulWidget {
  const ExportDashBoard({super.key});

  @override
  State<ExportDashBoard> createState() => _ExportDashBoardState();
}

class _ExportDashBoardState extends State<ExportDashBoard> {
  bool pendingRequest = true;
  bool ongoingOrders = false;

  @override
  void initState() {
    context.read<GetAllBadgesCubit>().getBadges();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText("Export DashBoard",
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0).r,
        child: BlocConsumer<GetAllBadgesCubit, GetAllBadgesState>(
          listener: (context, state) {
            print(state.toString());

            if (state is GetAllBadgesLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is GetAllBadgesLoaded) {
              Navigator.of(context).pop(true);
            }
            if (state is GetAllBadgesError) {
              WidgetFunctions.instance.snackBar(context, text: state.error);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return state is GetAllBadgesError
                ? AppText(state.error ?? '',
                    style: Styles.circularStdBold(context, fontSize: 14.sp))
                : state is GetAllBadgesLoaded
                    ? Column(
                        children: [
                          20.y,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TabButton(
                                active: pendingRequest,
                                title: 'Pending Requests',
                                onTap: () {
                                  if (pendingRequest != true) {
                                    pendingRequest = true;
                                    ongoingOrders = false;
                                    setState(() {});
                                  }
                                },
                              ),
                              TabButton(
                                active: ongoingOrders,
                                title: 'Ongoing Orders',
                                onTap: () {
                                  if (ongoingOrders != true) {
                                    ongoingOrders = true;
                                    pendingRequest = false;
                                    setState(() {});
                                  }
                                },
                              ),
                            ],
                          ),
                          10.y,
                          Expanded(
                            child:
                                ((ongoingOrders && state.ongoing!.isNotEmpty) ||
                                        (pendingRequest &&
                                            state.pending!.isNotEmpty))
                                    ? ListView.separated(
                                        padding: EdgeInsets.only(bottom: 10.sp),
                                        separatorBuilder: (context, index) {
                                          return 13.y;
                                        },
                                        itemCount: pendingRequest
                                            ? state.pending!.length
                                            : state.ongoing!.length,
                                        itemBuilder: (context, index) {
                                          return pendingRequest == true
                                              ? PendingOrders(
                                                  badges: state.pending![index],
                                                )
                                              : OngoingOrders(
                                                  badges: state.ongoing![index],
                                                );
                                        },
                                      )
                                    : Center(
                                        child: AppText('Data Not Found',
                                            style: Styles.circularStdRegular(
                                                context,
                                                fontSize: 15.sp)),
                                      ),
                          )
                        ],
                      )
                    : const SizedBox();
          },
        ),
      ),
    );
  }
}
