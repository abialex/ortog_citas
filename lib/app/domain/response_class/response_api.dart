import 'package:equatable/equatable.dart';

abstract class ResponseApi {
  const ResponseApi({
    required this.status,
    required this.type,
    required this.title,
    required this.success,
    this.detail,
    this.invalidParams,
    this.messages,
    required this.result,
  });

  final int status;
  final String type;
  final String title;
  final bool success;
  final String? detail;
  final dynamic? invalidParams;
  final List<String>? messages;
  final dynamic result;
}
