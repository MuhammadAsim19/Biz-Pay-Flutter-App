import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/add_buisness.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/chat.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/home.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/profile.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Saved/saved_listing.dart';

import 'Controller/BottomNavigationNotifier/bottom_navigation_notifier.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          //Floating action button on Scaffold
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            //code to execute on button press

            Navigate.to(context, const AddBusiness());
          },
          child: const Icon(Icons.add), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (x) {
              print(x);
              BottomNotifier.bottomNavigationNotifier.value = x;
            },
            children: [
              HomeScreen(),
              SavedListing(),
              ChatScreen(),
              ProfileScreen()
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 60,
          color: AppColors.whiteColor,
          shape: const CircularNotchedRectangle(),
          //shape of notch
          notchMargin: 5,
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.home,
                        color: state == 0 ? AppColors.primaryColor : null,
                      ),
                      AppText("Home",
                          style: Styles.circularStdRegular(context,
                              color: state == 0
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor,
                              fontSize: 12))
                    ],
                  ),
                  10.x,

                  ///Saved
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                          state == 1 ? Assets.heartBlue : Assets.heartLight),
                      AppText("Saved",
                          style: Styles.circularStdRegular(context,
                              color: state == 1
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor,
                              fontSize: 12))
                    ],
                  ),
                  50.x,

                  ///Chat
                  Column(
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
                  10.x,

                  ///Profile
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.profile,
                        color: state == 3 ? AppColors.primaryColor : null,
                      ),
                      AppText("Profile",
                          style: Styles.circularStdRegular(context,
                              color: state == 3
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor,
                              fontSize: 12))
                    ],
                  )
                ],
              );
            },
            valueListenable: BottomNotifier.bottomNavigationNotifier,
          ),
        ));
  }
}
