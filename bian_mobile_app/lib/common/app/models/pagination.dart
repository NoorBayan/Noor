import 'dart:convert';

class PaginationParamsModel {
  int page;
  bool isEndOfList;
  int? offset;
  // int total;
  final int limit;
  PaginationParamsModel({
    required this.page,
    // required this.total,
    required this.offset,
    required this.isEndOfList,
    required this.limit,
  }) {
    if (page > 1) {
      offset = page * limit;
    } else {
      offset = 0;
    }
  }

  static PaginationParamsModel get defaultParams => PaginationParamsModel(
        page: 1,
        // total: 0,
        offset: 0,
        isEndOfList: false,
        limit: 50,
      );

  PaginationParamsModel copyWith({
    int? page,
    bool? isEndOfList,
    int? offset,
    int? total,
    int? limit,
  }) {
    return PaginationParamsModel(
      page: page ?? this.page,
      isEndOfList: isEndOfList ?? this.isEndOfList,
      offset: offset ?? this.offset,
      // total: total ?? this.total,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
    };
  }

  factory PaginationParamsModel.fromMap(Map<String, dynamic> map) {
    return PaginationParamsModel(
      page: map['page']?.toInt() ?? 0,
      isEndOfList: map['is_end_of_list'] ?? false,
      offset: map['offset']?.toInt(),
      limit: map['limit']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationParamsModel.fromJson(String source) => PaginationParamsModel.fromMap(json.decode(source));
}

class WrapPaginationResultModel<T> extends Iterable<T> {
  final int total;
  final List<T> list;
  WrapPaginationResultModel({
    required this.total,
    required this.list,
  });

  @override
  Iterator<T> get iterator => list.iterator;

  @override
  List<T> toList({bool growable = true}) => list.toList(growable: growable);

  @override
  String toString() {
    return 'WrapPaginationResultModel{total: $total, list: $list}';
  }
}
