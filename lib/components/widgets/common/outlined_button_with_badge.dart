import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWithBadge extends StatelessWidget {
  final double width;
  final double heigth;
  final double borderRadius;
  final Icon icon;
  final Widget child;
  final Color color;
  final Color badgeColor;
  final Function() onPressed;
  final bool showBadge;

  const OutlinedButtonWithBadge(
      {Key? key,
      required this.width,
      required this.heigth,
      required this.borderRadius,
      required this.icon,
      required this.child,
      required this.color,
      required this.onPressed,
      required this.showBadge,
      required this.badgeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: badgeColor,
      position: const BadgePosition(top: 6, end: 2),
      padding: const EdgeInsets.all(1.0),
      badgeContent: icon,
      showBadge: showBadge,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: color),
            minimumSize: Size(width, heigth),
            maximumSize: Size(width, heigth),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
