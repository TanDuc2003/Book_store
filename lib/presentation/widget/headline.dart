import 'package:book_store/presentation/screen/book_list_screen.dart';
import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  HeadLine({
    super.key,
    required this.category,
    required this.showAll,
  });
  String category;
  String showAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.headline2,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookListScreen(name: showAll, title: category),
                  ));
            },
            child: Text(
              "Tất cả",
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        ],
      ),
    );
  }
}
