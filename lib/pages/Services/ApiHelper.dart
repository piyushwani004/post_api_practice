import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:post_api_practice/pages/Constant/constant.dart';
import 'package:post_api_practice/pages/Models/Post.dart';
import 'package:post_api_practice/pages/Models/httpResponse.dart';

class APIHelper {
  static Future<HTTPResponse<List<Post>>> getPosts(
      {int limit = 20, int page = 1}) async {
    String url = Constant.url + "?_limit=$limit&_page=$page";

    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("APIHelper Body:: $body");
        List<Post> postsList = [];
        body.forEach((e) {
          body.forEach((e) {
            Post post = Post.fromJson(e);
            postsList.add(post);
          });
          return HTTPResponse(true, postsList,
              responseCode: response.statusCode);
        });
      } else {
        return HTTPResponse(false, null,
            message: Constant.formatExecption,
            responseCode: response.statusCode);
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message: Constant.formatExecption,
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message: Constant.socketExecption,
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: Constant.catchError,
      );
    }
    return HTTPResponse(
      false,
      null,
      message: Constant.catchError,
    );
  }
}
