import 'package:flutter/material.dart';
import 'package:marketshitfchaitanya/constant/app_color.dart';

class MenuTileWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;
  final Color iconBackground;
  final Color titleColor;

  MenuTileWidget({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    required this.margin,
    this.iconBackground = AppColor.primarySoft,
    this.titleColor = AppColor.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColor.primarySoft, width: 1)),
        ),
        child: Row(
          children: [
            // Icon Box
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon,
            ),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) SizedBox(height: 2),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: AppColor.secondary.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColor.border,
            ),
          ],
        ),
      ),
    );
  }
}
