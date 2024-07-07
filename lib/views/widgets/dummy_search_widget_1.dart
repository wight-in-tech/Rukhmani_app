import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DummySearchWidget1 extends StatelessWidget {
  final VoidCallback onTap;

  DummySearchWidget1({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        margin: EdgeInsets.only(top: 24),
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
                color: Colors.black,
                width: 18,
                height: 18,
              ),
            ),
            Expanded(
              child: TextField(
                readOnly: true, // Prevents keyboard from popping up on tap
                onTap: onTap, // Directly forwarding the onTap event
                decoration: InputDecoration(
                  hintText: 'Find a product...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
