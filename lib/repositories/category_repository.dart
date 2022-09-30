import 'dart:async';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_spark/models/category.dart';
import 'package:xlo_spark/repositories/parse_errors.dart';
import 'package:xlo_spark/repositories/table_keys.dart';

class CategoryRepository {
  Future<List<dynamic>> getList() async {
    final query = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    final response = await query.query();

    if (response.success) {
      return response.result.map((e) => Category.fromParse(e)).toList();
    } else {
      return Future.error({ParseErrors.getDescription(response.error!.code)});
    }
  }
}
