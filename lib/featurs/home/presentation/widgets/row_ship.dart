import 'package:cp_project/core/global/global.dart';
import 'package:flutter/material.dart';

class RawChipWidget extends StatelessWidget {
  final String? label;
  final bool isSelected;
  final Function(bool, String)? onSelected;

  const RawChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      onSelected: ((value) => onSelected!(value, label!)),
      showCheckmark: false,
      label: Text(label!),
      selected: isSelected,
      labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
        color: isSelected
            ? AppConst.darkBlue
            : AppConst.textColor,
        fontWeight: FontWeight.w500,
      ),
      elevation: 1,
      shadowColor: Colors.black.withOpacity(0.2),
      backgroundColor: Colors.transparent,
      selectedColor: AppConst.skyBlue,
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side:BorderSide(
          width: 0.2,
          color: isSelected? Colors.lightBlue:AppConst.gray
        ),
      ),
    );
  }
}