part of 'multi_select_bottom_sheet_view.dart';

class MultiSelectBottomSheetController<T> extends BaseChangeNotifier {
  List<T> _itemsSelected = [];
  List<T> _listItems = [];
  bool Function(T item, bool isSelected)? _beforeItemSelected;
  String Function(T item)? _getItemText;
  late final int? _maxSelected;
  late final String? _textErrorMaxSelected;
  late final int _minSelected;
  late final bool isMultiSelect;
  late final bool isWithSelectAll;
  bool _isSelectAll = false;
  late final bool isReadOnly;
  late final List<T> initItemsSelected;
 

  // bool get isNotChandedYet {
  //   logger.i('$initItemsSelected $_itemsSelected');
  //   return false;
  // }
  bool get isNotChangedYet => listEquals(initItemsSelected, _itemsSelected);

  bool _isInit = false;
  String? _filterText;

  Future init({
    required List<T> itemsSelected,
    List<T>? listItem,
    Future<List<T>> Function()? asyncListItem,
    bool Function(T item, bool isSelected)? beforeItemSelected,
    String Function(T item)? getItemText,
    int? maxSelected,
    int minSelected = 1,
    String? textErrorMaxSelected,
    bool isMultiSelect = true,
    bool isWithSelectAll = true,
    bool isReadOnly = false,
  }) async {
    _itemsSelected = itemsSelected;
    initItemsSelected = List.from(itemsSelected);
    _getItemText = getItemText;
    _beforeItemSelected = beforeItemSelected;
    _maxSelected = maxSelected;
    _textErrorMaxSelected = textErrorMaxSelected;
    _minSelected = minSelected;
    this.isMultiSelect = isMultiSelect;
    this.isWithSelectAll = isWithSelectAll;
    this.isReadOnly = isReadOnly;

    if (listItem != null) {
      _listItems = listItem;
    } else if (asyncListItem != null) {
      isLoading = true;
      _listItems = await asyncListItem();
    }

    if (_itemsSelected.length == _listItems.length) {
      _isSelectAll = true;
    }
    _filterText = null;
    isLoading = false;
    _isInit = true;
  }

  bool get isSelectAll => _isSelectAll;
  set isSelectAll(bool value) {
    _isSelectAll = value;
    notifyListeners();
  }

  List<T> get itemsSelected => _itemsSelected;
  List<T> get listItems => _listItemsFiltered;
  String? get filterText => _filterText;

  set itemsSelected(List<T> itemsSelected) {
    _itemsSelected = itemsSelected;
    notifyListeners();
  }

  void addItemSelected(T item) {
    _itemsSelected.add(item);
    // notifyListeners();
  }

  bool get hasFilter => _filterText != null && _filterText!.isNotEmpty;

  List<T> get _listItemsFiltered {
    if (_filterText == null || _filterText!.trim().isEmpty) {
      return _listItems;
    }

    return _listItems
        .where((element) => getItemText(element)
            .toLowerCase()
            .contains(_filterText!.toLowerCase()))
        .toList();
  }

  void filterItemsByValue(String value) {
    if (value != _filterText) {
      _filterText = value;
      notifyListeners();
    }
  }

  void removeItemSelected(T item) {
    _itemsSelected.remove(item);
    notifyListeners();
  }

  void clearFilter() {
    _filterText = null;
    notifyListeners();
  }

  void clearItemsSelected() {
    _itemsSelected.clear();
    notifyListeners();
  }

  void removeItemSelectedAt(int indexString) {
    _itemsSelected.removeAt(indexString);
    // notifyListeners();
  }

  String getItemText(T item) {
    if (_getItemText != null) {
      return _getItemText!.call(item);
    }
    return item.toString();
  }

  void onPressedSelectAll() {
    if (isReadOnly) {
      return;
    }

    if (isSelectAll) {
      _itemsSelected.clear();
      _isSelectAll = false;
    } else {
      _itemsSelected = List<T>.from(_listItems);
      _isSelectAll = true;
    }
    notifyListeners();
  }

  void onPressedItem({required T item}) {
    if (isReadOnly) {
      return;
    }
    int selectedIndex = itemsSelected.indexOf(item);

    logger.i('selectedIndex: $selectedIndex');

    if (_beforeItemSelected != null) {
      bool isValid = _beforeItemSelected!.call(item, selectedIndex != -1);
      if (!isValid) return;
    }
    if (!isMultiSelect) {
      itemsSelected = List<T>.from([item]);

      return;
    }

    if (selectedIndex == -1) {
      if (_maxSelected == null || itemsSelected.length < _maxSelected!) {
        addItemSelected(item);
      } else {
        // show snackbar on the top of the screen
        if (_textErrorMaxSelected != null)
          FlashBarHelper.showFlashBarError(
            message: _textErrorMaxSelected!,
          );
      }
    } else {
      removeItemSelectedAt(selectedIndex);
    }

    if (_itemsSelected.length == _listItems.length) {
      isSelectAll = true;
    } else {
      isSelectAll = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    // _isInit = false;

    logger.i('MultiSelectBottomSheetController dispose');
  }
}
