// ignore_for_file: unused_local_variable, sort_child_properties_last

import 'package:book_store/app/constants/app_style.dart';
import 'package:book_store/presentation/screen/book_list_screen.dart';
import 'package:book_store/presentation/screen/search_screen.dart';
import 'package:book_store/presentation/widget/book/view_categories.dart';
import 'package:book_store/presentation/widget/book/popular_books.dart';
import 'package:book_store/presentation/widget/categories.dart';
import 'package:book_store/presentation/widget/headline.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 2,
              child: Stack(
                children: [
                  Container(
                    height: height / 2.5,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: SafeArea(
                      minimum: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Shimmer.fromColors(
                            child: Text(
                              "Book Store",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            baseColor: Colors.black,
                            highlightColor: Colors.red,
                            direction: ShimmerDirection.ltr,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // show search
                              showSearch(
                                  context: context, delegate: CustomSearch());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 1, color: AppColors.black)),
                              child: Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: Colors.orange,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Nhập tên sách cần tìm ... ",
                                    ),
                                    Icon(Icons.search),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(flex: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sách thịnh hành",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookListScreen(
                                            name: "thinhhanh",
                                            title: 'Thịnh Hành'),
                                      ));
                                },
                                child: Text(
                                  "Tất cả",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              )
                            ],
                          ),
                          const Spacer(flex: 5),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: height / 5.3,
                      margin: const EdgeInsets.only(left: 16),
                      child: const PopularBook(),
                    ),
                  ),
                ],
              ),
            ),
            HeadLine(
              category: "Hoạt Hình",
              showAll: "Anime",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "Anime"),
            ),
            HeadLine(
              category: "Truyện cười",
              showAll: "truyencuoi",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "truyencuoi"),
            ),
            HeadLine(
              category: "Truyện Ma",
              showAll: "truyenma",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "truyenma"),
            ),
            HeadLine(
              category: "Tiên Hiệp",
              showAll: "tienhiep",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "tienhiep"),
            ),
            HeadLine(
              category: "Kiếm Hiệp",
              showAll: "kiemhiep",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "kiemhiep"),
            ),
            HeadLine(
              category: "Truyện Teen",
              showAll: "truyenteen",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "truyenteen"),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                child: Shimmer.fromColors(
                  child: Text(
                    "Một vài thể loại khác",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  baseColor: Colors.orange,
                  highlightColor: Colors.black,
                )),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: [
                    Categories(title: 'Tình cảm', name: "tinhcam"),
                    Categories(title: 'Giả tường', name: "giatuong"),
                    Categories(title: 'Tiểu sử', name: "tieusu"),
                    Categories(title: 'Truyện ngắn', name: "truyenngan"),
                    Categories(title: 'Bài luận ', name: "bailuan"),
                    Categories(title: 'Lịch sử ', name: "lichsu"),
                    Categories(title: 'Giả tưởng ', name: "giatuong"),
                    Categories(title: 'Khoa học', name: "khoahoc"),
                    Categories(title: 'Lịch sử ', name: "lichsu"),
                    Categories(title: 'Giả tưởng ', name: "giatuong"),
                    Categories(title: 'Tiên Hiệp', name: "tienhiep"),
                    Categories(title: 'Ngôn Tình', name: "ngontinh"),
                    Categories(title: 'Đô Thị', name: "dothi"),
                    Categories(title: 'Dị Giới', name: "digioi"),
                    Categories(title: 'Tiểu Thuyết ', name: "tieuthuyet"),
                    Categories(title: 'Võng Du', name: "vongvu"),
                    Categories(title: 'Xuyên Không', name: "xuyenkhong"),
                    Categories(title: 'Trinh Thám ', name: "trinhtham"),
                    Categories(title: 'Quân Sự', name: "quansu"),
                    Categories(title: 'Khoa Huyễn', name: "khoahuyen"),
                    Categories(title: 'Truyện Ma', name: "truyenma"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
