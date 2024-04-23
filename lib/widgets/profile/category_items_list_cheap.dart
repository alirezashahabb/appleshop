import 'package:flutter/material.dart';

class CategoryItemCheap extends StatelessWidget {
  const CategoryItemCheap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: ShapeDecoration(
            shadows: const [
              BoxShadow(
                spreadRadius: -11,
                color: Colors.red,
                blurRadius: 30,
                offset: Offset(0, 13),
              ),
            ],
            color: Colors.red,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: const Icon(
            Icons.mouse,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'همه',
          style: TextStyle(
            fontFamily: 'Sb',
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
