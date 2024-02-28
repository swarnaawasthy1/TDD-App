import 'package:flutter/material.dart';

class CustomResponse {
  bool success;
  String message;
  dynamic data;
  dynamic fullResponse;
  CustomResponse({
    required this.success,
    required this.message,
    @required this.data,
    this.fullResponse,
  });
}
