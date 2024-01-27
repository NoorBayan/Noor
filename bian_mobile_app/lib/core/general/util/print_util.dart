
import '../helpers/custom_logger.dart';


extension FutureExtension on Future {
  Future<T> printAwaitTime<T>(String? title) async {
    final stopwatch = Stopwatch()..start();
    final result = await this;
    stopwatch.stop();
    logger.i('${title ?? 'Time'} : ${stopwatch.elapsedMilliseconds}ms'
        ' <AwaitTime> ');
    return result;
  }
}
