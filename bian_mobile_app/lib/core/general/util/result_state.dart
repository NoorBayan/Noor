import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/custom_logger.dart';

part 'result_state.freezed.dart';

/// ResultState is a wrapper class that can be used to represent the state of a [Future] function call that returns a [T] data type.
///
/// Like: network call, database call, etc.
///
/// Example:
///
/// ```dart
/// Future<ResultState<User>> getUser() async {
///  try {
///   final user = await _api.getUser();
///  return ResultState.success(data: user);
/// } on NetworkException {
///  return ResultState.failure(error: NetworkExceptions.getErrorMessage());
/// }
///
/// // Usage
/// var result = await getUser();
/// // first method
/// if (result.isSuccess) {
///  // do something
/// } else {
/// // do something
/// }
///
/// // second method
/// result.when(
/// success: (user) {
/// // do something
/// },
/// failure: (error) {
/// // do something
/// }
/// );
/// ```
///
///
@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.success({
    /// [data] is the data that is returned from the api call or the data from any [Future] function.
    ///
    /// [T] is the type of data that will be returned.
    required T data,

    /// [tag] is an optional parameter to add a tag to the result
    /// to identify it later.
    String? tag,
  }) = Success<T>;

  const factory ResultState.failure({
    /// [error] is the error that is returned from the api call or the error from any [Future] function.
    required Object error,

    /// [stackTrace] is the stack trace of the error.
    StackTrace? stackTrace,

    /// [message] is an optional parameter to add a message to the result to identify it later.
    String? message,
  }) = Failure<T>;
}

extension ResultStateExtension<T> on ResultState<T> {
  bool get isSuccess => this is Success;

  bool get isFailure => this is Failure;

  /// Returns the data of the [ResultState] if it is a [Success] or throws the error if it is a [Failure].
  T get data {
    if (isSuccess) {
      return (this as Success<T>).data;
    } else {
      throw (this as Failure<T>).error;
    }
  }

  T? get dataOrNull {
    if (isSuccess) {
      return (this as Success<T>).data;
    } else {
      return null;
    }
  }

  /// Returns the error if the result is a failure, otherwise returns null.
  Object? get error {
    if (isFailure) {
      return (this as Failure<T>).error;
    } else {
      return null;
    }
  }

  /// Returns the stack trace if the result is a failure, otherwise returns null.
  StackTrace? get stackTrace {
    if (isFailure) {
      return (this as Failure<T>).stackTrace;
    } else {
      return null;
    }
  }

  /// Returns true if the result is a failure, and the error is of type [NetworkExceptions].
  // bool get isNetworkError => error is NetworkExceptions;

  /// Returns true if the result is a failure, and the error is of type [NoInternetConnection].
  // bool get isNoInternetConnectionError => error is NoInternetConnection;

  /// Returns true if the result is a failure, and the error is of type [UnauthorizedRequest].
  // bool get isUnauthorizedError {
  //   if (error is ApiResponseError) {
  //     if ((error as ApiResponseError).error.errorType is UnauthorizedRequest) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // bool get isApiResponseError => error is ApiResponseError;

  // ApiResponseErrorModel? get apiResponseErrorModel {
  //   if (error is ApiResponseError) {
  //     return (error as ApiResponseError).error;
  //   }
  //   return null;
  // }

  // /// Returns the message if the result is a failure, and the error is a [NetworkExceptions], otherwise returns empty string.
  // String get msgNetworkError {
  //   if (error is NetworkExceptions) {
  //     return NetworkExceptions.getErrorMessage(error as NetworkExceptions);
  //   } else {
  //     return '';
  //   }
  // }

  /// Returns the message if the result is a failure, otherwise returns empty string.
  // String get msgError {
  //   if (isNetworkError) {
  //     return msgNetworkError;
  //   }
  //   return error.toString();
  // }
}

// wrap the Future with a try/catch block
extension ResultStateFutureExtension<T> on Future<T> {
  /// Wrap the Future with a try/catch block
  /// and return a [ResultState] object
  /// with the result of the Future or the error if any.
  ///
  /// [tag] is an optional parameter to add a tag to the result
  /// to identify it later
  Future<ResultState<T>> toResultState({String? tag}) async {
    try {
      final data = await this;
      return ResultState.success(data: data);
    } catch (e, s) {
      logger.e(e);
      return ResultState.failure(error: e);
    }
  }
}
