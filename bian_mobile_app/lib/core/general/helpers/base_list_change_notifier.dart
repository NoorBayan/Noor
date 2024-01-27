import '../../../common/app/models/pagination.dart';
import '../util/result_state.dart';
import 'base_change_notifier.dart';

abstract class BaseListChangeNotifier<T> extends BaseChangeNotifier {
  List<T>   list = [];
  PaginationParamsModel paginationParamsModel =
      PaginationParamsModel.defaultParams;

  Future<List<T>> getData() async {
    final result = await getDataResult(false);
    if (result is Success) {
      if (result.data.isEmpty ||
          result.data.length < paginationParamsModel.limit) {
        paginationParamsModel.isEndOfList = true;
      }
      list = result.data;
    } else {
      hasError = true;
      list = [];
    }
    return list;
  }

  Future<ResultState<List<T>>> getDataResult(bool shouldIncreasePageNumber);

  Future getMoreData() async {
    final result = await getDataResult(true);

    if (result.isSuccess) {
      if (result.data.isEmpty ||
          result.data.length < paginationParamsModel.limit) {
        paginationParamsModel.isEndOfList = true;
      }

      for (var element in result.data) {
        if (!list.contains(element)) {
          list.add(element);
        }
      }
    } else {
      paginationParamsModel.page--;
    }
  }

  Future loadMore() async {
    if (isLoading || isLoadingMore || paginationParamsModel.isEndOfList) {
      return;
    }

    getDataWithLoadingMore();
  }

  Future<void> refresh() async {
    paginationParamsModel = PaginationParamsModel.defaultParams;
    list = [];
    getDataWithLoading();
  }

  Future<void> getDataWithLoading() async {
    isLoading = true;
    await getData();
    isLoading = false;
  }

  void getDataWithLoadingMore() async {
    isLoadingMore = true;
    await getMoreData();
    isLoadingMore = false;
  }
}
