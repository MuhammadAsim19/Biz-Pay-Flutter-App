import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Dialogs/loading_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Components/ongoing_orders_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Components/pending_requests_tile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Components/tab_buttons.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Requests/Controller/get_all_badges_request_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  bool pendingRequest = true;

  bool ongoingOrders = false;

  @override
  void initState() {
    context.read<AllBadgesRequestCubit>().getBadgesRequest(isBroker: false);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Business Dashboard',
          leading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0).r,
          child: BlocConsumer<AllBadgesRequestCubit, AllBadgesRequestState>(
            listener: (context, state) {
              print(state.toString());

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
                                  title: 'Accepted Request',
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
                              child: ((ongoingOrders &&
                                          state.ongoing!.isNotEmpty) ||
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
                                            ? AcceptedOrders(
                                                isFromBusiness: true,
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
        ));
  }
}
