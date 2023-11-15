import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';

class ScrollableChipsWidget extends StatelessWidget {
  final List<String> chipsData;
  final EdgeInsets? padding;
  final double spacing;
  final Color? chipBackgroundColor;
  final Color? chipLabelColor;

  const ScrollableChipsWidget({
    Key? key,
    required this.chipsData,
    this.padding = EdgeInsets.zero,
    this.spacing = 8.0,
    this.chipBackgroundColor,
    this.chipLabelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: padding??EdgeInsets.symmetric(horizontal: 22.50.sp, vertical: 12.sp),
        child: Wrap(
          spacing: spacing,
          children: chipsData.map((chipLabel) => _buildChip(chipLabel)).toList(),
        ),
      ),
    );
  }

  Widget _buildChip(String chipLabel) {
    return Chip(
      backgroundColor: chipBackgroundColor,
      label: Text(
        chipLabel,
        style: TextStyle(color: chipLabelColor),
      ),
    );
  }
}