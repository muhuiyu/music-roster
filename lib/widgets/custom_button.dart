import 'package:music_roster_admin/constants/constants.dart';
import 'package:flutter/material.dart';

enum CustomButtonType { primary, primaryWhite, primaryGrey, secondary, text }

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.type,
  });

  final Widget? child;
  final void Function() onPressed;
  final CustomButtonType type;

  late Color _backgroundColor = AppColors.primary;
  late Color _borderColor = AppColors.primary;
  late double _borderWidth = 1;
  final double _borderRadius = 8;

  _configureStyle() {
    switch (type) {
      case CustomButtonType.primary:
        _backgroundColor = AppColors.primary;
        _borderColor = AppColors.primary;
        break;
      case CustomButtonType.primaryWhite:
        _backgroundColor = AppColors.white;
        _borderColor = AppColors.white;
        break;
      case CustomButtonType.primaryGrey:
        _backgroundColor = AppColors.lightGrey;
        _borderColor = AppColors.lightGrey;
        break;
      case CustomButtonType.secondary:
        _backgroundColor = Colors.transparent;
        _borderColor = AppColors.primary;
        break;
      case CustomButtonType.text:
        _backgroundColor = Colors.transparent;
        _borderColor = Colors.transparent;
        _borderWidth = 0;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _configureStyle();

    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          side: BorderSide(width: _borderWidth, color: _borderColor),
        )),
        backgroundColor: MaterialStateProperty.all<Color>(_backgroundColor),
        elevation: const MaterialStatePropertyAll(0),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
      ),
      child: child,
    );
  }
}

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.text,
    this.imageName,
    required this.onPressed,
    required this.type,
    this.textColor = AppColors.white,
  });

  final String text;
  final void Function() onPressed;
  final CustomButtonType type;

  final String? imageName;
  late Color textColor;

  _configureStyle() {
    switch (type) {
      case CustomButtonType.primary:
        textColor = AppColors.white;
        break;
      case CustomButtonType.primaryWhite:
        textColor = AppColors.primary;
        break;
      case CustomButtonType.primaryGrey:
        textColor = AppColors.secondaryLabel;
        break;
      case CustomButtonType.secondary:
        textColor = AppColors.primary;
        break;
      case CustomButtonType.text:
        textColor = AppColors.primary;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _configureStyle();

    List<Widget> widgets = [];

    if (imageName != null) {
      widgets.add(Image.asset(
        imageName!,
        width: 28,
        height: 28,
      ));
      widgets.add(const SizedBox(width: 12));
    }
    widgets.add(Text(text, style: AppTextStyle.getButtonTextStyle(textColor)));

    return CustomButton(
        onPressed: onPressed,
        type: type,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widgets,
        ));
  }
}
