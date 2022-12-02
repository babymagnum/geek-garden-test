import 'package:flutter/material.dart';
import 'package:geek_garden_test/data/values/strings.dart';
import 'package:get/get.dart';

class BaseService extends GetConnect {
  Future<Response<dynamic>> getRequest({required String url}) async {
    debugPrint('GET Request: ${httpClient.baseUrl}$url');
    final data = await get(url);
    debugPrint('Response: ${data.body}');

    return data;
  }

  @override
  void onInit() {
    httpClient.baseUrl = fakeBaseUrl;
    super.onInit();
  }
}