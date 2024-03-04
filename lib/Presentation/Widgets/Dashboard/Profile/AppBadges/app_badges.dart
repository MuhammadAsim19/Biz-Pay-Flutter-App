import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Common/Shimmer/Widgets/app_badges_shimmer.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/AppBadges/Controller/app_budges_cubit.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBadgesScreen extends StatefulWidget {
  const AppBadgesScreen({super.key});

  @override
  State<AppBadgesScreen> createState() => _AppBadgesScreenState();
}

class _AppBadgesScreenState extends State<AppBadgesScreen> {
  @override
  void initState() {
    context.read<AppBudgesCubit>().getBadges();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "App Badges",
        leading: true,
      ),
      body: BlocConsumer<AppBudgesCubit, AppBudgesState>(
        listener: (context, state) {
          if (state is AppBudgesError) {
            WidgetFunctions.instance.snackBar(context, text: state.error);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is AppBudgesLoaded
              ? SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          elevation: 1,
                          child: ListTile(
                            leading: SvgPicture.asset(Assets.appBadges,
                                height: 25.sp, width: 25.sp),
                            title: AppText(state.appBadges?[index].title ?? "",
                                style: Styles.circularStdRegular(context,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600)),
                            subtitle: AppText(
                                "\$ ${state.appBadges?[index].price.toString()}" ??
                                    "",
                                style: Styles.circularStdRegular(context,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400)),
                            trailing: InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {},
                              child: CircleAvatar(
                                  radius: 15.sp,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 17.sp,
                                  )),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: state.appBadges!.length),
                )
              : state is AppBudgesLoading
                  ? const AppBadgesShimmer()
                  : state is AppBudgesError
                      ? AppText(state.error!,
                          style: Styles.circularStdRegular(context))
                      : const SizedBox();
        },
      ),
    );
  }
}
