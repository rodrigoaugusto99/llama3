import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:ollama/app/app.logger.dart';

class HttpService {
  final _log = getLogger("HttpService");
  Future<Stream<String>> postStream({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    // Cria a requisição
    var request = http.Request('POST', Uri.parse(url))
      ..headers['Content-Type'] = 'application/json'
      ..body = jsonEncode(body);

    // Envia a requisição e obtém uma resposta em forma de Stream
    final response = await http.Client().send(request);
    // _log.v(response.toString());
    // _log.v(response.request);
    // _log.v(response.statusCode);
    // _log.v(response.reasonPhrase);
    // _log.v(response.stream.toString());
    // _log.i(response);

    // Retorna o Stream transformado em Strings
    _log.i(response.stream.transform(utf8.decoder));
    return response.stream.transform(utf8.decoder);
  }

  Future<void> post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    // Cria a requisição
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      _log.i("Success: ${response.body}");
      return;
    }

    if (response.statusCode >= 400) {
      _log.e("Error: ${response.statusCode}");
      throw Exception("Failed to post");
    }
  }

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    // Cria a requisição
    final response = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      _log.i("Success: ${response.body}");
      return decodedResponse;
    } else {
      _log.e("Error: ${response.statusCode}");
      throw Exception("Failed to get");
    }
  }

  Future<void> delete({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    // Cria a requisição
    final response = await http.delete(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      _log.i("Success: ${response.body}");
    } else {
      _log.e("Error: ${response.statusCode}");
      throw Exception("Failed to delete");
    }
  }
}
