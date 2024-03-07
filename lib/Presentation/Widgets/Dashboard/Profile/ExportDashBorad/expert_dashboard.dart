import 'package:buysellbiz/Application/Services/Navigation/navigation.dart';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/LinkBank/link_bank_screen.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/ExportDashBorad/Withdraw/withdraw_screen.dart';
import 'package:flutter/material.dart';

class ExpertDashboard extends StatelessWidget {
  const ExpertDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Expert Dashboard',
        leading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          ListTile(
            onTap: () {},
            title: AppText(
              'Requests',
              style: Styles.circularStdRegular(context, fontSize: 18),
            ),
            leading: Icon(Icons.upcoming, size: 24.sp),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 12.sp),
          ),
          10.y,
          ListTile(
            onTap: () {
              Navigate.to(context, const WithdrawScreen());
            },
            title: AppText(
              'Withdraw',
              style: Styles.circularStdRegular(context, fontSize: 18),
            ),
            leading: Icon(Icons.monetization_on, size: 24.sp),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 12.sp),
          ),
          10.y,
          ListTile(
            onTap: () {
              Navigate.to(context, const LinkBankScreen());
            },
            title: AppText(
              'Link Bank',
              style: Styles.circularStdRegular(context, fontSize: 18),
            ),
            leading: Icon(Icons.account_balance, size: 24.sp),
            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 12.sp),
          ),
        ],
      ),
    );
  }
}
