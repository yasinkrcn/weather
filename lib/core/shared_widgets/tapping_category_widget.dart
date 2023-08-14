import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TappingCategoryWidget extends StatelessWidget {
  final String assetPath;
  final String text;
  final double assetAngle;
  final void Function()? onTap;
  const TappingCategoryWidget({
    super.key,
    required this.assetPath,
    required this.text,
    required this.onTap,
    required this.assetAngle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(angle: assetAngle, child: SvgPicture.asset(assetPath)),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
