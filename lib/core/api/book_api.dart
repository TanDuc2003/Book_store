import 'dart:ffi';

import 'package:http/http.dart' as http;

class BookApi {
  Future getBooks() async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=Fiction&maxResults=40"),
    );
    var body = response.body;
    return body;
  }

  Future showBookDetails({required String id}) async {
    String s = "https://www.googleapis.com/books/v1/volumes/$id";
    // print(s);
    final response = await http.get(Uri.parse(s));
    var body = response.body;
    return body;
  }

  //tìm kiếm
  Future searchBook({required String searchBook, int? page}) async {
    final page = 38;
    String s =
        "https://www.googleapis.com/books/v1/volumes?q=$searchBook&maxResults=$page";
    final response = await http.get(
      Uri.parse(s),
      // headers: headers,
    );

    print(s);
    var body = response.body;
    return body;
  }
 
}
