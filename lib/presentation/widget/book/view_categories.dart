import 'package:book_store/app/constants/app_style.dart';
import 'package:book_store/app/provider/app_provider.dart';
import 'package:book_store/core/model/book_model.dart';
import 'package:book_store/presentation/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppProvider>(context);
    String errorLink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";

    return FutureBuilder(
      future: data.searchBookData(searchBook: name),
      builder: (context, AsyncSnapshot<BookModel> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Có Lỗi! Hãy thử lại sau!"),
          );
        }
        if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (p0, p1) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.items!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreens(
                              id: snapshot.data!.items![index].id),
                        ),
                      );
                      print("anime${snapshot.data!.items![index].id}");
                    },
                    child: Container(
                      width: p1.maxWidth * 0.30,
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 2,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: p1.maxWidth * 0.6,
                              height: p1.maxHeight * 0.6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: NetworkImage(snapshot
                                              .data!
                                              .items![index]
                                              .volumeInfo!
                                              .imageLinks ==
                                          null
                                      ? errorLink
                                      : snapshot.data!.items![index].volumeInfo!
                                          .imageLinks!.thumbnail!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Text(
                              "${snapshot.data!.items![index].volumeInfo!.title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                            height: p1.maxHeight * 0.1,
                            width: p1.maxWidth * 0.18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "\$${snapshot.data!.items![index].volumeInfo!.pageCount}",
                              style: const TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.pink,
          ),
        );
      },
    );
  }
}
