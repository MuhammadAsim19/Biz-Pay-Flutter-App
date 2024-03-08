import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Components/ongoing_orders_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Components/pending_requests_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Components/tab_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Controller/get_all_badges_request_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  bool isRejected = false;

  @override
  void initState() {
    context.read<AllBadgesRequestCubit>().getBadgesRequest(isBroker: true);
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
            AppText("Requests",
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
        child: BlocConsumer<AllBadgesRequestCubit, AllBadgesRequestState>(
          listener: (context, state) {
            if (state is AllBadgesRequestLoading) {
              LoadingDialog.showLoadingDialog(context);
            }
            if (state is AllBadgesRequestLoaded) {
              Navigator.of(context).pop(true);
            }
            if (state is AllBadgesRequestError) {
              Navigator.of(context).pop(true);
              WidgetFunctions.instance.snackBar(context, text: state.error);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return state is AllBadgesRequestError
                ? Center(
                    child: AppText(state.error ?? '',
                        style:
                            Styles.circularStdBold(context, fontSize: 14.sp)),
                  )
                : state is AllBadgesRequestLoaded
                    ? Column(
                        children: [
                          20.y,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TabButton(
                                active: !isRejected,
                                title: 'Requests',
                                onTap: () {
                                  setState(() {
                                    isRejected = false;
                                  });
                                },
                              ),
                              TabButton(
                                active: isRejected,
                                title: 'Rejected',
                                onTap: () {
                                  setState(() {
                                    isRejected = true;
                                  });
                                },
                              ),
                            ],
                          ),
                          10.y,
                          Expanded(
                              child: ListView.separated(
                            padding: EdgeInsets.only(bottom: 10.sp),
                            separatorBuilder: (context, index) {
                              return 13.y;
                            },
                            itemCount: !isRejected
                                ? state.pending!.length
                                : state.rejected!.length,
                            itemBuilder: (context, index) {
                              return RequestTile(
                                badgesRequest: !isRejected
                                    ? state.pending![index]
                                    : state.rejected![index],
                                isFromBusiness: false,
                              );
                            },
                          ))
                        ],
                      )
                    : const SizedBox();
          },
        ),
      ),
    );
  }
}
