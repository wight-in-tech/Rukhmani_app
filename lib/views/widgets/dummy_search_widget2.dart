import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DummySearchWidget2 extends StatelessWidget {
  final VoidCallback onTap;

  DummySearchWidget2({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  color: Colors.white,
                  width: 18,
                  height: 18,
                ),
              ),
              Expanded(
                child: TextField(
                  readOnly: true, // Prevents keyboard from popping up on tap
                  decoration: InputDecoration(
                    hintText: 'Find a product...',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 14),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
