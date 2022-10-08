import 'package:book_store/app/constants/app_style.dart';
import 'package:book_store/app/provider/app_provider.dart';
import 'package:book_store/presentation/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularBook extends StatelessWidget {
  const PopularBook({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppProvider>(context);
    return FutureBuilder(
      future: data.getBookData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Rất tiếc! Thử lại sau!"),
          );
        }
        if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (p0, p1) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(snapshot.data!.items![index].id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreens(
                              id: snapshot.data!.items![index].id,
                            ),
                          ));
                    },
                    child: Container(
                      width: p1.maxWidth * 0.8,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.zero,
                                child: Container(
                                  height: p1.maxHeight,
                                  width: p1.minWidth * 0.30,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(
                                            width: 1, color: Colors.black38)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image(
                                        image: NetworkImage(
                                            "${snapshot.data?.items![index].volumeInfo?.imageLinks?.thumbnail}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: p1.maxWidth * 0.03,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.items![index].volumeInfo!
                                              .authors!.length !=
                                          0
                                      ? snapshot.data!.items![index].volumeInfo!
                                          .authors![0]
                                      : "Chưa có thông tin",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                        fontSize: p1.maxWidth * 0.038,
                                      ),
                                ),
                                Text(
                                  "${snapshot.data!.items![index].volumeInfo!.title}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontSize: p1.maxWidth * 0.048,
                                      ),
                                ),
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo!.categories?.length != 0 ? snapshot.data?.items![index].volumeInfo!.categories![0] : "Chưa cập nhật"}",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(fontSize: p1.maxWidth * 0.038),
                                ),
                                const Spacer(flex: 1),
                                Container(
                                  height: p1.maxHeight * 0.2,
                                  width: p1.maxWidth * 0.18,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "\$${snapshot.data?.items![index].volumeInfo?.pageCount ?? "96.9"}",
                                    style: const TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Spacer(flex: 1),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return Center(
            child: CircularProgressIndicator(
          color: AppColors.black,
        ));
      },
    );
  }
}
