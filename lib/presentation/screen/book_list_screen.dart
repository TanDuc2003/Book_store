// ignore_for_file: prefer_is_empty

import 'package:book_store/app/constants/app_style.dart';
import 'package:book_store/app/provider/app_provider.dart';
import 'package:book_store/core/model/book_model.dart';
import 'package:book_store/presentation/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

class BookListScreen extends StatefulWidget {
  BookListScreen({
    super.key,
    required this.name,
    required this.title,
  });
  final String name;
  final String title;

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final _random = math.Random();

//

//

  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: value.searchBookData(searchBook: widget.name),
            builder: (context, AsyncSnapshot<BookModel> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Có Lỗi! Hãy thử lại sau!"),
                );
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.items!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent: 260,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreens(
                                  id: snapshot.data!.items![index].id),
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: LayoutBuilder(
                            builder: (p0, p1) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: p1.maxHeight / 2,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: p1.maxHeight / 2.5,
                                          decoration: BoxDecoration(
                                            color:
                                                boxColors[_random.nextInt(7)],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          child: Card(
                                            margin: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: SizedBox(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image(
                                                  height: p1.maxHeight / 2,
                                                  width: p1.maxWidth / 2,
                                                  image: NetworkImage(snapshot
                                                              .data!
                                                              .items![index]
                                                              .volumeInfo!
                                                              .imageLinks ==
                                                          null
                                                      ? errorLink
                                                      : snapshot
                                                          .data!
                                                          .items![index]
                                                          .volumeInfo!
                                                          .imageLinks!
                                                          .thumbnail!),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot
                                                      .data!
                                                      .items![index]
                                                      .volumeInfo!
                                                      .authors!
                                                      .length !=
                                                  0
                                              ? snapshot.data!.items![index]
                                                  .volumeInfo!.authors![0]
                                              : "Chưa có thông tin",
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                  fontSize: p1.maxWidth * 0.09),
                                        ),
                                        Text(
                                          "${snapshot.data?.items![index].volumeInfo?.title}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.copyWith(
                                                  fontSize: p1.maxWidth * 0.09,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          child: Text(
                                            snapshot.data!.items![index]
                                                .volumeInfo!.pageCount
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: p1.maxWidth * 0.08,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.black,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
