import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Domain/Packages/package_model.dart';

class SubscriptionSelection extends StatelessWidget {
  const SubscriptionSelection({
    super.key,
    required this.onChange,
    required this.selectedVal,
    required this.packages,
  });
  final Function(PackageModel value) onChange;
  final String selectedVal;
  final List<PackageModel> packages;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: packages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 130,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => PackageWidget(
        package: packages[index],
        isSelected: selectedVal == packages[index].id,
        onTap: () {
          onChange(packages[index]);
        },
      ),
    );
  }
}

class PackageWidget extends StatelessWidget {
  const PackageWidget(
      {super.key,
      required this.package,
      required this.isSelected,
      required this.onTap});
  final PackageModel package;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
        ),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(10),
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              package.title ?? '',
              style: Styles.circularStdRegular(
                context,
                color: AppColors.greyLightColor,
              ),
            ),
            6.y,
            AppText(
              '\$${package.price}',
              style: Styles.circularStdMedium(
                context,
                fontSize: 24,
                color: AppColors.primaryColor,
              ),
            ),
            6.y,
            AppText(
              package.duration ?? '',
              style: Styles.circularStdMedium(
                context,
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
