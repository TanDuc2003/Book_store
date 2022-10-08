import 'dart:convert';

import 'package:book_store/core/api/book_api.dart';
import 'package:book_store/core/model/book_model.dart';
import 'package:book_store/core/model/details_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  final BookApi bookApi = BookApi();

  // api books
  Future<BookModel> getBookData() async {
    var res = await bookApi.getBooks();
    var data = jsonDecode(res);
    // print('getbox>>>>>>>>> ${data}');
    return BookModel.fromJson(data);
  }

  // api book details
  Future<DetailsModel> showBookData({required String id}) async {
    var res = await bookApi.showBookDetails(id: id);
    var data = jsonDecode(res);
    // print('showbox>>>>>>>>> ${data}');
    return DetailsModel.fromJson(data);
  }

  //tìm kiếm sách

  Future<BookModel> searchBookData({required String searchBook}) async {
    var res = await bookApi.searchBook(searchBook: searchBook);
    //print(res);
    var data = jsonDecode(res);
    // print('search mssdsadasd>>>>>>>>> ${data}');
    return BookModel.fromJson(data);
  }
}
