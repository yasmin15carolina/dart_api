import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:test/expect.dart';

import '../repositories/user_repository.dart';

part 'user_controller.g.dart';

class UserController {
  @Route.get('/')
  Future<Response> find(Request request) async {
    try {
      final users = await UserRepository().findAll();
      return Response.ok(
        jsonEncode(
          users.map((u) => u.toMap()).toList(),
        ),
        headers: {
          'content-type': 'application/json',
        },
      );
    } catch (e) {
      return Response.internalServerError();
    }
  }

  // router.get('/<param>', (Request req, String param){
  //     print(req.url.queryParameters["query"]);// acessing a url query
  //     return Response.ok(param);
  //   });

  @Route.post('/login')
  Future<Response> findOne(Request request, String login) async {
    try {
      var users;
      String agora = "roi";
      Map postData = new Map();
      var body = await request.readAsString().then((String body) async {
        postData = jsonDecode(body);
        agora = jsonEncode(postData);
        users = await UserRepository().findOne("yas", "asdf"
            // postData['username'],
            // postData['password'],
            );
      });

      return Response.ok(
        //postData['username'].toString()
        // agora
        // .url.queryParameters["query"]
        jsonEncode(
          users.map((u) => u.toMap()).toList(),
        ),
        headers: {
          'content-type': 'application/json',
        },
      );
    } catch (e) {
      return Response.internalServerError();
    }
  }

  Router get router => _$UserControllerRouter(this);
}
