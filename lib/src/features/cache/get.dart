import 'package:weather/weather.dart';

import 'cache.dart';

class CacheLocation {
  static const userCacheKey = '__user_cache_key__';

  static final CacheClient _cache = CacheClient();

  static void saveLocation(List<Weather> weather) {
    _cache.write(key: userCacheKey, value: weather);
  }

  // static void saveLocation(Weather weather) {
  //   _cache.write(key: userCacheKey, value: [...currentList, weather]);
  // }

  static List<Weather> get currentList {
    return _cache.read<List<Weather>>(key: userCacheKey) ?? [];
  }
}
