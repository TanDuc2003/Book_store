// ignore_for_file: prefer_is_empty

import 'package:book_store/app/provider/app_provider.dart';
import 'package:book_store/core/model/book_model.dart';
import 'package:book_store/presentation/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CustomSearch extends SearchDelegate {
  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
          size: 30,
        ),
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 30,
        ));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.searchBookData(searchBook: query),
          builder: (context, AsyncSnapshot<BookModel> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Rất tiếc! Thử lại sau!"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.items == null
                    ? 0
                    : snapshot.data!.items!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreens(
                              id: snapshot.data!.items![index].id,
                            ),
                          ));
                    },
                    leading: Image.network(
                      snapshot.data!.items![index].volumeInfo!.imageLinks ==
                              null
                          ? errorLink
                          : snapshot.data!.items![index].volumeInfo!.imageLinks!
                              .thumbnail!,
                      fit: BoxFit.fill,
                      width: 50,
                    ),
                    // ignore: prefer_is_empty
                    title: Text(snapshot.data!.items![index].volumeInfo!
                                .authors!.length !=
                            0
                        ? snapshot.data!.items![index].volumeInfo!.authors![0]
                        : "Không tìm thấy"),
                    subtitle:
                        Text(snapshot.data!.items![index].volumeInfo!.title!),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.searchBookData(searchBook: "Biography"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Rất tiếc! Thử lại sau!"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreens(
                                id: snapshot.data!.items![index].id,
                              ),
                            ));
                      },
                      leading: Image.network(snapshot.data?.items?[index]
                              .volumeInfo?.imageLinks?.thumbnail ??
                          errorLink),
                      title: Text(
                        "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found"}",
                      ),
                      subtitle: Text(
                          "${snapshot.data?.items![index].volumeInfo?.title}"));
                },
              );
            }
            return Center(
              child: Shimmer.fromColors(
                  child: CircularProgressIndicator(),
                  baseColor: Colors.orange,
                  highlightColor: Colors.black),
            );
          },
        );
      },
    );
    throw UnimplementedError();
  }
}
