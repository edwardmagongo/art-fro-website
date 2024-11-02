import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SearchHistory =
          prefs.getStringList('ff_SearchHistory') ?? _SearchHistory;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_NotificationConfiguration')) {
        try {
          final serializedData =
              prefs.getString('ff_NotificationConfiguration') ?? '{}';
          _NotificationConfiguration =
              NotificationConfiguresStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _ShippingMethod = prefs.getString('ff_ShippingMethod') ?? _ShippingMethod;
    });
    _safeInit(() {
      _PaymentMethod = prefs.getString('ff_PaymentMethod') ?? _PaymentMethod;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _toggle = false;
  bool get toggle => _toggle;
  set toggle(bool value) {
    _toggle = value;
  }

  DefaultsStruct _defaults = DefaultsStruct.fromSerializableMap(jsonDecode(
      '{\"brandName\":\"Art(Fro) Scentric Studios\",\"brandTagline\":\"Empowering Art, Enriching Lives\",\"logo\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/art-fro-scentric-studios-p9iy2z/assets/29v56yskh21o/Black_logo.png\",\"avatarDefaultImage\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/l260dcr57pr2/user-default.png\",\"imagesDefaultImage\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/a105n0zo09d5/images.png\"}'));
  DefaultsStruct get defaults => _defaults;
  set defaults(DefaultsStruct value) {
    _defaults = value;
  }

  void updateDefaultsStruct(Function(DefaultsStruct) updateFn) {
    updateFn(_defaults);
  }

  List<String> _Categories = ['All', 'Painting', 'Digital Art'];
  List<String> get Categories => _Categories;
  set Categories(List<String> value) {
    _Categories = value;
  }

  void addToCategories(String value) {
    Categories.add(value);
  }

  void removeFromCategories(String value) {
    Categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    Categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Categories[index] = updateFn(_Categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    Categories.insert(index, value);
  }

  List<String> _SearchHistory = ['Paintings', 'Digital Art'];
  List<String> get SearchHistory => _SearchHistory;
  set SearchHistory(List<String> value) {
    _SearchHistory = value;
    prefs.setStringList('ff_SearchHistory', value);
  }

  void addToSearchHistory(String value) {
    SearchHistory.add(value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeFromSearchHistory(String value) {
    SearchHistory.remove(value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeAtIndexFromSearchHistory(int index) {
    SearchHistory.removeAt(index);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void updateSearchHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SearchHistory[index] = updateFn(_SearchHistory[index]);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void insertAtIndexInSearchHistory(int index, String value) {
    SearchHistory.insert(index, value);
    prefs.setStringList('ff_SearchHistory', _SearchHistory);
  }

  String _HomePagePath = '';
  String get HomePagePath => _HomePagePath;
  set HomePagePath(String value) {
    _HomePagePath = value;
  }

  NotificationConfiguresStruct _NotificationConfiguration =
      NotificationConfiguresStruct.fromSerializableMap(jsonDecode(
          '{\"EnableNotification\":\"true\",\"Sound\":\"true\",\"Vibrate\":\"false\",\"SpecialOffers\":\"true\",\"PromoDiscount\":\"true\",\"Cashback\":\"true\",\"NewServices\":\"true\"}'));
  NotificationConfiguresStruct get NotificationConfiguration =>
      _NotificationConfiguration;
  set NotificationConfiguration(NotificationConfiguresStruct value) {
    _NotificationConfiguration = value;
    prefs.setString('ff_NotificationConfiguration', value.serialize());
  }

  void updateNotificationConfigurationStruct(
      Function(NotificationConfiguresStruct) updateFn) {
    updateFn(_NotificationConfiguration);
    prefs.setString(
        'ff_NotificationConfiguration', _NotificationConfiguration.serialize());
  }

  String _ShippingMethod = 'Local';
  String get ShippingMethod => _ShippingMethod;
  set ShippingMethod(String value) {
    _ShippingMethod = value;
    prefs.setString('ff_ShippingMethod', value);
  }

  String _PaymentMethod = 'M-Pesa';
  String get PaymentMethod => _PaymentMethod;
  set PaymentMethod(String value) {
    _PaymentMethod = value;
    prefs.setString('ff_PaymentMethod', value);
  }

  String _currentpage = '';
  String get currentpage => _currentpage;
  set currentpage(String value) {
    _currentpage = value;
  }

  final _allProductsManager = FutureRequestManager<List<ProductRecord>>();
  Future<List<ProductRecord>> allProducts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProductRecord>> Function() requestFn,
  }) =>
      _allProductsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllProductsCache() => _allProductsManager.clear();
  void clearAllProductsCacheKey(String? uniqueKey) =>
      _allProductsManager.clearRequest(uniqueKey);

  final _specialOfferSingleProductRefManager =
      FutureRequestManager<SpecialOfferRecord>();
  Future<SpecialOfferRecord> specialOfferSingleProductRef({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<SpecialOfferRecord> Function() requestFn,
  }) =>
      _specialOfferSingleProductRefManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSpecialOfferSingleProductRefCache() =>
      _specialOfferSingleProductRefManager.clear();
  void clearSpecialOfferSingleProductRefCacheKey(String? uniqueKey) =>
      _specialOfferSingleProductRefManager.clearRequest(uniqueKey);

  final _productHasSpecialOfferManager =
      FutureRequestManager<List<ProductRecord>>();
  Future<List<ProductRecord>> productHasSpecialOffer({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProductRecord>> Function() requestFn,
  }) =>
      _productHasSpecialOfferManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductHasSpecialOfferCache() =>
      _productHasSpecialOfferManager.clear();
  void clearProductHasSpecialOfferCacheKey(String? uniqueKey) =>
      _productHasSpecialOfferManager.clearRequest(uniqueKey);

  final _specialOffersAllManager =
      FutureRequestManager<List<SpecialOfferRecord>>();
  Future<List<SpecialOfferRecord>> specialOffersAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SpecialOfferRecord>> Function() requestFn,
  }) =>
      _specialOffersAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSpecialOffersAllCache() => _specialOffersAllManager.clear();
  void clearSpecialOffersAllCacheKey(String? uniqueKey) =>
      _specialOffersAllManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
