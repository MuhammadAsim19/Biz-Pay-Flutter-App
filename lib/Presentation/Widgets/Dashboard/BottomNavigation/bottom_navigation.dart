import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/Extensions/extensions.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/AddBuisness/add_buisness.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/Controller/add_business_conntroller.dart';
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
    return  Scaffold(
      floatingActionButton:FloatingActionButton(
        //Floating action button on Scaffold
        backgroundColor: AppColors.primaryColor,
        onPressed: (){
          //code to execute on button press
AddNotifier.addBusinessNotifier.value=0;
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
          physics:
               const NeverScrollableScrollPhysics()
              ,
          onPageChanged: (x) {
            print(x);
            BottomNotifier.bottomNavigationNotifier.value = x;
          },
          children: [
            const HomeScreen(),
            SavedListing(),
            const ChatScreen(),
            const ProfileScreen()


          ],

        ),


      ),
bottomNavigationBar:
         BottomAppBar(
           height: 60,
        color:AppColors.whiteColor,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 5, //notche margin between floating button and bottom appbar
        child:  ValueListenableBuilder(
             builder: (context,state,ss) {
            return Row( //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //5.x,
///Home
              GestureDetector(
                onTap: ()
                {
                  if(state != 0) {
                    pageController.jumpToPage(0);
                BottomNotifier.bottomNavigationNotifier.value=0;

                  }



                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  SvgPicture.asset(state==0?Assets.homeFilled:Assets.home,),
                  AppText("Home", style: Styles.circularStdRegular(context,color: state==0?AppColors.primaryColor:AppColors.blackColor,fontSize: 12))

                ],),
              ) ,
10.x,
              ///Saved
              GestureDetector(
                onTap: ()
                {
                  if(state != 1) {
                    pageController.jumpToPage(1);
                    BottomNotifier.bottomNavigationNotifier.value=1;

                  }



                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,children: [
                  SvgPicture.asset(state==1?Assets.heartBlue:Assets.heartLight),
                  AppText("Saved", style: Styles.circularStdRegular(context,color: state==1?AppColors.primaryColor:AppColors.blackColor,fontSize: 12))

                ],),
              ),
              50.x,
              ///Chat
              GestureDetector(
                onTap: ()
                {
                  if(state != 2) {
                    pageController.jumpToPage(2);
                    BottomNotifier.bottomNavigationNotifier.value=2;

                  }



                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  SvgPicture.asset(state==2?Assets.chatBlue:Assets.chatLight),
                  AppText("Chat", style: Styles.circularStdRegular(context,color: state==2?AppColors.primaryColor:AppColors.blackColor,fontSize: 12))

                ],),
              ),
              10.x,

              ///Profile
              GestureDetector(
                onTap: ()
                {
                  if(state != 3) {
                    pageController.jumpToPage(3);
                    BottomNotifier.bottomNavigationNotifier.value=3;

                  }



                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  SvgPicture.asset(state==3?Assets.profileFilled:Assets.profile ),
                  AppText("Profile", style: Styles.circularStdRegular(context,color: state==3?AppColors.primaryColor:AppColors.blackColor,fontSize: 12))

                ],),
              )

            ],


    );
          }, valueListenable: BottomNotifier.bottomNavigationNotifier,
        ),
        )
  
);


  }
}
