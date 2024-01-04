// import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
// import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
// import 'package:buysellbiz/Domain/BusinessModel/buisiness_model.dart';
// import 'package:buysellbiz/Presentation/Widgets/Dashboard/Buisness/BuisnessDetails/buisness_details.dart';
// import 'package:buysellbiz/Presentation/Widgets/Dashboard/Chat/chat.dart';
// import 'package:buysellbiz/Presentation/Widgets/Dashboard/Home/home.dart';
// import 'package:buysellbiz/Presentation/Widgets/Dashboard/SearchListing/Components/search_business_widget.dart';
//
// class BusniessSearch extends StatefulWidget {
//   BusniessSearch({this.model, super.key});
//
//   final List<BusinessModel>? model;
//
//   @override
//   State<BusniessSearch> createState() => _BusniessSearchState();
// }
//
// class _BusniessSearchState extends State<BusniessSearch> {
//   TextEditingController search = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             40.y,
//             CustomTextFieldWithOnTap(
//               readOnly: false,
//               controller: search,
//               borderRadius: 40,
//               isBorderRequired: false,
//               isShadowRequired: true,
//               prefixIcon: SvgPicture.asset(Assets.searchIcon),
//               hintText: 'Search for business',
//               textInputType: TextInputType.text,
//             ),
//             5.y,
//             AppText("129 Business",
//                 style: Styles.circularStdMedium(context, fontSize: 16)),
//             5.y,
//             Expanded(
//               child: SearchBusinessWidget(
//                 businessProducts: widget.model,
//                 getData: (BusinessModel val) {
//                   print(val.name);
//
//                   Navigate.to(context, const BusinessDetails());
//                 },
//                 chatTap: (BusinessModel val) {
//                   //BottomNotifier.bottomPageController.removeListener(() { });
//                   // BottomNotifier.bottomPageController=PageController(initialPage: 2);
//                   // BottomNotifier.bottomNavigationNotifier.value=2;
//                   //
//                   // Navigate.toReplace(context, const BottomNavigationScreen(initialPage: 2,));
//
//                   Navigate.to(
//                       context,
//                       ChatScreen(
//                         backButton: true,
//                       ));
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
