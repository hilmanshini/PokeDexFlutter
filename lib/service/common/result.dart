import 'package:flutter/cupertino.dart';

sealed class Result<T> {
  const Result();

  bool isLoading() => this is Loading;
  bool isSucceed() => this is Success;
  bool isFailure() => this is Failure;
  bool isIdle() => this is Idle;
  T getData() => (this as Success<T>).data;
  T getDataOrDefault(T t) {
    if(isSucceed()){
      return (this as Success<T>).data;
    } else {
      return t;
    }
  }
}

class Idle<T> extends Result<T> {
  const Idle();
}

class Loading<T> extends Result<T> {
  const Loading();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final Object error;
  final StackTrace trace;
  const Failure(this.error,this.trace);
}

extension  ResultExt<T> on Result<T>{

  Widget mapWidget({
    Widget Function() onIdle = defaultIdle,
    Widget Function(T) onSuccess = defaultSuccess,
    Widget Function() onLoading = defaultIdle,
    Widget Function(Object,StackTrace) onFailure = defaultError,
  }) {
    // if()
    if(this.isIdle()){
      return onIdle();
    } else if (isFailure()){
      Failure<T> fail = this as Failure<T>;
      return onFailure(fail.error,fail.trace);
    } else if (isLoading()){
      return onLoading();
    } else if(isSucceed()){
      Success<T> data = this as Success<T>;
      return onSuccess(data.data);
    }
    return Container();
  }

  static  Widget defaultIdle() =>  Container();
  static  Widget defaultError(Object,StackTrace) =>  Container();
  static  Widget defaultSuccess<T>(T) =>  Container();

}