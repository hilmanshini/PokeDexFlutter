import 'dart:async';

import 'package:pokemon2/service/common/result.dart' show Result, Loading, Failure, Success;


typedef StreamCallback<T> = Function(StreamController<T> controller, StreamSink<
    T> sink);

Stream<Result<T>> usecaseUi<T>(StreamCallback<Result<T>> callback) {
  StreamController<Result<T>> streamController = StreamController<Result<T>>();
  try {
    callback.call(streamController, streamController.sink);
  } catch (e, stack) {
    streamController.sink.error(e, stack);
  }
  var stream = streamController.stream;
  return stream;
}
extension SinkExt<T> on StreamSink<Result<T>>{
  void loading() {
    add(Loading<T>());
  }

  void error(e, stack) {
    add(Failure(e,stack));
  }

  void success(T t) {
    add(Success(t));
  }
}

extension ListExtensions<T> on List<T> {
  T? getOrNull(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    }
    return null;
  }
}

extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}