import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final void Function()? onPressed;

  const MoreButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        AppImages.moreIcon,
      ),
    );
  }
}
