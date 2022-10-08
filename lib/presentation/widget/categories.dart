import 'package:book_store/app/constants/app_style.dart';
import 'package:book_store/presentation/screen/book_list_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:shimmer/shimmer.dart';

class Categories extends StatelessWidget {
  Categories({
    super.key,
    required this.title,
    required this.name,
  });
  final String title;
  final String name;
  @override
  Widget build(BuildContext context) {
    final _random = math.Random();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: boxColors[_random.nextInt(7)],
          borderRadius: BorderRadius.circular(12),
        ),
        width: 150,
        height: 80,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookListScreen(name: name, title: title),
                ));
  // chuyển show bookLisst
          },
          child: Shimmer.fromColors(
            // ignore: sort_child_properties_last
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            direction: ShimmerDirection.rtl,
            baseColor: Colors.black,
            highlightColor: Colors.black26,
          ),
        ),
      ),
    );
  }
}
