import 'dart:io';

import 'package:buysellbiz/Application/Services/Connectivity/connectivity_service.dart';
import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/AppData/app_initializer.dart';
import 'package:buysellbiz/Data/AppData/app_preferences.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_meta_data.dart';
import 'package:buysellbiz/Data/Services/Notification/notification_services.dart';
import 'package:buysellbiz/Presentation/Common/dialog.dart';
import 'package:buysellbiz/Presentation/Common/no_internet_connection.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/add_buisness.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/Controllers/Repo/inboox_repo.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/chat.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/home.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/logout_dialog.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/saved_listing.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/scheduler.dart';

import 'Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int? initialPage;
  final RemoteMessage? message;

  const BottomNavigationScreen({super.key, this.initialPage, this.message});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  //final PageController pageController = PageController(initialPage: 0);

  late final AppLifecycleListener _listener;
  late AppLifecycleState? _state;
  final List<String> _states = <String>[];

  init(BuildContext context) async {
    await AppInitializer.init().whenComplete(() async {
      InboxRepo().initSocket(context, Data().user?.user?.id);

      await NotificationServices().permission().whenComplete(() {
        NotificationMetaData().foregroundNotificationHandler();
        NotificationMetaData().setContext(context);
        NotificationMetaData().notificationPayload(context);
        NotificationMetaData().backgroundNotificationOnTapHandler();
        NotificationMetaData().terminatedFromOnTapStateHandler(
            context: context, payLoadData: widget.message);

        _state = SchedulerBinding.instance.lifecycleState;
        _listener = AppLifecycleListener(
          onShow: () => _handleTransition('show'),
          onResume: () => _handleTransition('resume'),
          onHide: () => _handleTransition('hide'),
          onInactive: () => _handleTransition('inactive'),
          onPause: () => _handleTransition('pause'),
          onDetach: () => _handleTransition('detach'),
          onRestart: () => _handleTransition('restart'),
          // This fires for each state change. Callbacks above fire only for
          // specific state transitions.
          onStateChange: _handleStateChange,
        );
      });
      //InboxRepo().initSocket(context, Data().user?.user?.id);
    });
  }

  void _handleStateChange(AppLifecycleState state) {
    // setState(() {
    //   _state = state;
    // });
    print(state);
    // WidgetFunctions
    //     .instance.snackBar(context,text: state.name,bgColor: AppColors.primaryColor);
  }

  void _handleTransition(String name) {
    // setState(() {
    //   _states.add(name);
    // });
    print("state name$name");
    if (name == "resume") {
      // InboxRepo().initSocket(context, Data().user!.user!.id);

      // WidgetFunctions
      //   .instance.snackBar(context,text: name,bgColor: AppColors.primaryColor);
    }
    if (name == 'inactive') {
      // InboxRepo.socket?.disconnect();
      print('inActive state called');
    }
  }

  @override
  void initState() {
    if (SharedPrefs.getUserToken() != null) {
      //connection();
      init(context);
      // BottomNotifier.bottomPageController=pageContr oller;
      ///do not remove new keyword flutter is confused
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // executes after build
        BottomNotifier.bottomNavigationNotifier.value = 0;
      });
      //AppInitializer.init();
    }
    BottomNotifier.bottomPageController =
        PageController(initialPage: widget.initialPage ?? 0);
    //BottomNotifier.bottomNavigationNotifier.value=widget.initialPage??0;
    BottomNotifier.checkExitTimes.value = 2;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (BottomNotifier.bottomPageController!.page != 0) {
          BottomNotifier.bottomNavigationNotifier.value = 0;
          BottomNotifier.checkExitTimes.value = 2;
          BottomNotifier.bottomPageController!.jumpToPage(0);
        } else {
          if (BottomNotifier.checkExitTimes.value == 0) {
            exit(0);
          } else {
            WidgetFunctions.instance.toast(
                context,
                SnackBar(
                  content: AppText(
                    'Press Again To Exit',
                    style: Styles.circularStdRegular(context,
                        color: AppColors.whiteColor),
                  ),
                  backgroundColor: AppColors.primaryColor,
                  duration: const Duration(seconds: 1),
                ));

            BottomNotifier.checkExitTimes.value--;
          }
        }
        return false;
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            //Floating action button on Scaffold
            backgroundColor: AppColors.primaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              //code to execute on button press
              if (Data.app?.user?.user?.id != null) {
                AddNotifier.addBusinessNotifier.value = 0;
                Navigate.to(context, const AddBusiness());
              } else {
                CustomDialog.dialog(
                    barrierDismissible: true, context, const GuestDialog());
              }
            },
            child: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ), //icon inside button
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: PageView(
              controller: BottomNotifier.bottomPageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (x) {
                print(x);
                BottomNotifier.bottomNavigationNotifier.value = x;
              },
              children: const [
                HomeScreen(),
                SavedListing(),
                ChatScreen(),
                ProfileScreen()
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 70,
            color: Colors.transparent,

            shape: const CircularNotchedRectangle(),
            //shape of notch
            // notchMargin: 5,
            //notche margin between floating button and bottom appbar
            child: ValueListenableBuilder(
              builder: (context, state, ss) {
                return Row(
                  //children inside bottom appbar
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //5.x,
                    ///Home
                    GestureDetector(
                      onTap: () {
                        if (state != 0) {
                          BottomNotifier.bottomPageController!.jumpToPage(0);
                          BottomNotifier.bottomNavigationNotifier.value = 0;
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            state == 0 ? Assets.homeFilled : Assets.home,
                          ),
                          AppText("Home",
                              style: Styles.circularStdRegular(context,
                                  color: state == 0
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 12))
                        ],
                      ),
                    ),
                    10.x,

                    ///Saved
                    GestureDetector(
                      onTap: () {
                        if (SharedPrefs.getUserToken() != null) {
                          if (state != 1) {
                            BottomNotifier.bottomPageController!.jumpToPage(1);
                            BottomNotifier.bottomNavigationNotifier.value = 1;
                          }
                        } else {
                          CustomDialog.dialog(
                              barrierDismissible: true,
                              context,
                              const GuestDialog());
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(state == 1
                              ? Assets.heartBlue
                              : Assets.heartLight),
                          AppText("Saved",
                              style: Styles.circularStdRegular(context,
                                  color: state == 1
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 12))
                        ],
                      ),
                    ),
                    50.x,

                    ///Chat
                    GestureDetector(
                      onTap: () {
                        if (SharedPrefs.getUserToken() != null) {
                          if (state != 2) {
                            BottomNotifier.bottomPageController!.jumpToPage(2);
                            BottomNotifier.bottomNavigationNotifier.value = 2;
                          }
                        } else {
                          CustomDialog.dialog(
                              barrierDismissible: true,
                              context,
                              const GuestDialog());
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                              state == 2 ? Assets.chatBlue : Assets.chatLight),
                          AppText("Chat",
                              style: Styles.circularStdRegular(context,
                                  color: state == 2
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 12))
                        ],
                      ),
                    ),
                    10.x,

                    ///Profile
                    GestureDetector(
                      onTap: () {
                        if (SharedPrefs.getUserToken() != null) {
                          if (state != 3) {
                            BottomNotifier.bottomPageController!.jumpToPage(3);
                            BottomNotifier.bottomNavigationNotifier.value = 3;
                          }
                        } else {
                          CustomDialog.dialog(
                              barrierDismissible: true,
                              context,
                              const GuestDialog());
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(state == 3
                              ? Assets.profileFilled
                              : Assets.profile),
                          AppText("Profile",
                              style: Styles.circularStdRegular(context,
                                  color: state == 3
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                                  fontSize: 12))
                        ],
                      ),
                    )
                  ],
                );
              },
              valueListenable: BottomNotifier.bottomNavigationNotifier,
            ),
          )),
    );
  }
}
