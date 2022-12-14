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
                                      "Nh???p t??n s??ch c???n t??m ... ",
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
                                "S??ch th???nh h??nh",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookListScreen(
                                            name: "thinhhanh",
                                            title: 'Th???nh H??nh'),
                                      ));
                                },
                                child: Text(
                                  "T???t c???",
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
              category: "Ho???t H??nh",
              showAll: "Anime",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "Anime"),
            ),
            HeadLine(
              category: "Truy???n c?????i",
              showAll: "truyencuoi",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "truyencuoi"),
            ),
            HeadLine(
              category: "Truy???n Ma",
              showAll: "truyenma",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "truyenma"),
            ),
            HeadLine(
              category: "Ti??n Hi???p",
              showAll: "tienhiep",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "tienhiep"),
            ),
            HeadLine(
              category: "Ki???m Hi???p",
              showAll: "kiemhiep",
            ),
            SizedBox(
              height: height / 3.4,
              child: const ViewCategories(name: "kiemhiep"),
            ),
            HeadLine(
              category: "Truy???n Teen",
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
                    "M???t v??i th??? lo???i kh??c",
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
                    Categories(title: 'T??nh c???m', name: "tinhcam"),
                    Categories(title: 'Gi??? t?????ng', name: "giatuong"),
                    Categories(title: 'Ti???u s???', name: "tieusu"),
                    Categories(title: 'Truy???n ng???n', name: "truyenngan"),
                    Categories(title: 'B??i lu???n ', name: "bailuan"),
                    Categories(title: 'L???ch s??? ', name: "lichsu"),
                    Categories(title: 'Gi??? t?????ng ', name: "giatuong"),
                    Categories(title: 'Khoa h???c', name: "khoahoc"),
                    Categories(title: 'L???ch s??? ', name: "lichsu"),
                    Categories(title: 'Gi??? t?????ng ', name: "giatuong"),
                    Categories(title: 'Ti??n Hi???p', name: "tienhiep"),
                    Categories(title: 'Ng??n T??nh', name: "ngontinh"),
                    Categories(title: '???? Th???', name: "dothi"),
                    Categories(title: 'D??? Gi???i', name: "digioi"),
                    Categories(title: 'Ti???u Thuy???t ', name: "tieuthuyet"),
                    Categories(title: 'V??ng Du', name: "vongvu"),
                    Categories(title: 'Xuy??n Kh??ng', name: "xuyenkhong"),
                    Categories(title: 'Trinh Th??m ', name: "trinhtham"),
                    Categories(title: 'Qu??n S???', name: "quansu"),
                    Categories(title: 'Khoa Huy???n', name: "khoahuyen"),
                    Categories(title: 'Truy???n Ma', name: "truyenma"),
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
