import 'dart:io';
import 'dart:developer';
import 'package:path/path.dart';

import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';


class CacheManager {

  CacheManager._();

  static final CacheManager _manager = CacheManager._();

  static CacheManager get instance => _manager;

  final _cachePolicy = GetStorage("mom_cache");

  void setSyncTime(String key) async {
    _cachePolicy.write(key, DateTime.now().toString());
  }

  bool needToSync(String key){
    final now = DateTime.now();
    final oldTime = _cachePolicy.read(key);
    if(oldTime==null) {
      return true;
    }
    return now.difference(DateTime.parse(oldTime)).inMinutes > 2;
  }

  Future<bool> cacheData(String data,String key) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path,'$key.txt');
    final file = File(path);
    await file.writeAsString(data);
    setSyncTime(key);
    return true;
  }

  Future<String> cache(String key) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path,'$key.txt');
    final file = File(path);
    if(await file.exists()){
      final data = file.readAsStringSync();
      return data;
    }
    return '';
  }

}