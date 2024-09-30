import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:ollama/app/app.logger.dart';

class HttpService {
  final _log = getLogger("HttpService");
  Future<Stream<String>> postStream1({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    // Cria a requisição
    var request = http.Request('POST', Uri.parse(url))
      ..headers['Content-Type'] = 'application/json'
      ..body = jsonEncode(body);

    // Envia a requisição e obtém uma resposta em forma de Stream
    final response = await http.Client().send(request);
    _log.i(response);
    _log.i(response.stream);
    // _log.i(response);

    // Retorna o Stream transformado em Strings
    return response.stream.transform(utf8.decoder);
  }

  Future<void> post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    // Cria a requisição
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      _log.i("Success: ${response.body}");
    } else {
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
    );
    if (response.statusCode == 200) {
      _log.i("Success: ${response.body}");
    } else {
      _log.e("Error: ${response.statusCode}");
      throw Exception("Failed to delete");
    }
  }
}
