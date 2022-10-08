// ignore_for_file: prefer_is_empty

import 'package:book_store/app/constants/app_style.dart';
import 'package:book_store/app/provider/app_provider.dart';
import 'package:book_store/core/model/details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreens extends StatefulWidget {
  DetailsScreens({super.key, required this.id, this.boxcolors});
  var id;
  Color? boxcolors;
  @override
  State<DetailsScreens> createState() => _DetailsScreensState();
}

class _DetailsScreensState extends State<DetailsScreens> {
  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "không thể chạy ${uri}";
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return widget.id != null
              ? FutureBuilder(
                  future: value.showBookData(id: widget.id),
                  builder: (context, AsyncSnapshot<DetailsModel> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Có Lỗi! Hãy thử lại sau!"),
                      );
                    }
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 350,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: height * 200,
                                    decoration: BoxDecoration(
                                      color: widget.boxcolors ??
                                          const Color(0xffF9CFE3),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: height * 250,
                                      alignment: Alignment.center,
                                      child: FadeInImage.memoryNetwork(
                                        width: width * 150,
                                        height: height * 250,
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        placeholder: kTransparentImage,
                                        image: snapshot.data!.volumeInfo!
                                                    .imageLinks ==
                                                null
                                            ? errorLink
                                            : snapshot.data!.volumeInfo!
                                                .imageLinks!.thumbnail!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 70,
                                    left: 16,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(width: 1),
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.black,
                                      ),
                                      label: const Text(
                                        "",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data!.volumeInfo!.title ??
                                        "Chưa cập nhật",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 24),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    snapshot.data!.volumeInfo!.authors
                                                ?.length !=
                                            0
                                        ? snapshot.data!.volumeInfo!.authors![0]
                                        : "Chưa cập nhật",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data!.volumeInfo!.printType!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        const Spacer(flex: 2),
                                        Container(
                                          height: height * 35,
                                          width: width * 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.black,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "\$${snapshot.data?.volumeInfo?.pageCount}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        const Spacer(flex: 2),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${snapshot.data?.volumeInfo?.pageCount}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const TextSpan(
                                                text: " trang",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(width: 1),
                                        ),
                                        onPressed: () async {
                                          await _launchURL(snapshot
                                              .data!.volumeInfo!.previewLink!);
                                        },
                                        child: Text(
                                          "XEM ONLINE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ),
                                      OutlinedButton.icon(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(width: 1)),
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: AppColors.black,
                                        ),
                                        label: Text(
                                          "WISHLIST",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Chi tiết",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tác giả",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                            Text(
                                              "Nhà xuất bản",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                            Text(
                                              "Ngày xuất bản",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                            Text(
                                              "Thể loại",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.volumeInfo!
                                                            .authors!.length ==
                                                        0
                                                    ? "Chưa có thông tin"
                                                    : snapshot.data!.volumeInfo!
                                                        .authors![0],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                snapshot.data!.volumeInfo!
                                                        .publisher!.isEmpty
                                                    ? "Chưa có thông tin"
                                                    : snapshot.data!.volumeInfo!
                                                        .publisher!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                snapshot.data!.volumeInfo!
                                                            .publishedDate ==
                                                        null
                                                    ? "Chưa có thông tin"
                                                    : snapshot.data!.volumeInfo!
                                                        .publishedDate!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                snapshot
                                                            .data!
                                                            .volumeInfo!
                                                            .categories!
                                                            .length ==
                                                        0
                                                    ? "Chưa có thông tin"
                                                    : snapshot.data!.volumeInfo!
                                                        .categories![0],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Mô tả",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(height: 10),
                                  ReadMoreText(
                                    "${snapshot.data!.volumeInfo!.description == null ? "Chưa có thông tin" : snapshot.data!.volumeInfo!.description}",
                                    trimLines: 6,
                                    colorClickableText: AppColors.black,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: "...Đọc thêm",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontSize: 14),
                                    trimExpandedText: " Thu gọn",
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 150,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          await _launchURL(snapshot
                                              .data!.volumeInfo!.infoLink!);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.black,
                                        ),
                                        child: Text(
                                          "MUA",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("Không có dữ liệu"),
                );
        },
      ),
    );
  }
}
