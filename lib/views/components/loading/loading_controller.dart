import 'package:flutter/foundation.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String);

@immutable
class LoadingController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;
  LoadingController({required this.close,required this.update ,});
}
