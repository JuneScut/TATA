import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/io_client.dart';
import 'package:http_client_helper/http_client_helper.dart';

import 'api_path.dart';

class Api {
  static Dio _dio;

  static void init() {
    HttpClient http = HttpClient();
    http.badCertificateCallback = (cert, host, port) => true;
    IOClient client = IOClient(http);
    HttpClientHelper().set(client);
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.headers['accept'] = 'application/vnd.vhiphop.v$version+json'
      ..interceptors.add(InterceptorsWrapper(onRequest: _handleRequest));
  }

  static RequestOptions _handleRequest(RequestOptions options) {
    String fullPath = options.baseUrl + options.path;

    if (options.method == 'GET' && options.queryParameters.length > 0) {
      List params = [];
      options.queryParameters.forEach((k, v) => params.add('$k=$v'));
      fullPath += '?' + params.join('&').toString();
      print(fullPath);
    }

    final time = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    options.headers.addAll({
      'x-date': '$time',
      'x-token': '123456',
      // 'x-user-id': Constants.user.id == null ? '' : '${Constants.user.id}',
      // 'x-user-token': Constants.user.token ?? '',
    });

    return options;
  }

  static final _fetchTypes = <String, Function>{
    'post': _dio.post,
    'put': _dio.put,
    'patch': _dio.patch,
    'delete': _dio.delete,
    'head': _dio.head,
  };

  static Future<dynamic> head(url, {Map<String, dynamic> data}) async {
    return await _fetch('head', url, data);
  }

  static Future<dynamic> get(url, {Map<String, dynamic> data}) async {
    return await _fetch('get', url, data);
  }

  static Future<dynamic> post(url, {Map<String, dynamic> data}) async {
    return await _fetch('post', url, data);
  }

  static Future<dynamic> put(url, {Map<String, dynamic> data}) async {
    return await _fetch('put', url, data);
  }

  static Future<dynamic> patch(url, {Map<String, dynamic> data}) async {
    return await _fetch('patch', url, data);
  }

  static Future<dynamic> delete(url, {Map<String, dynamic> data}) async {
    return await _fetch('delete', url, data);
  }

  static Future<dynamic> _fetch(method, url, data) async {
    try {
      final Response response = method == 'get'
        ? await _dio.get(url, queryParameters: data)
        : await _fetchTypes[method](url, data: data);
      return response.data;
    } catch (e) {
      final error = (e is DioError
          && e.response != null
          && e.response.statusCode == 403)
        ? e.response.data
        : {"message": "服务器网络繁忙，请稍后再试", "status_code": 1001};

      // showTip(error['message']);

      throw error;
    }
  }
}
