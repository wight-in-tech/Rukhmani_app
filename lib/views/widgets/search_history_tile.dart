import 'package:flutter/material.dart';
import 'package:marketshitfchaitanya/constant/app_color.dart';
import 'package:marketshitfchaitanya/core/model/Search.dart';

class SearchHistoryTile extends StatelessWidget {
  final SearchHistory data;
  final VoidCallback onTap;
  final VoidCallback? onDelete; // Optional function for deleting the item

  const SearchHistoryTile({
    required this.data,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap, // Assign onTap as a callback
            child: Text(
              data.title,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        if (onDelete != null) // Only show delete icon if onDelete is provided
          IconButton(
            icon: Icon(Icons.delete, color: AppColor.error),
            onPressed: onDelete, // Call onDelete function
          ),
      ],
    );
  }
}
