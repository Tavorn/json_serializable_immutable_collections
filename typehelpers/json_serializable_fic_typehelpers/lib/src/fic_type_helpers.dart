// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/type.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:json_serializable/type_helper.dart';
import 'package:json_serializable/src/shared_checkers.dart';
import 'package:json_serializable/src/constants.dart';
import 'package:json_serializable/src/lambda_result.dart';
import 'package:json_serializable/src/utils.dart';
import 'package:json_serializable_type_helper_utils/json_serializable_type_helper_utils.dart';
import 'package:source_gen/source_gen.dart';

class FICIListTypeHelper extends CustomIterableTypeHelper<IList> {
  @override
  String deserializeFromIterableExpression(
      String expression, DartType resolvedGenericType) {
    return expression + '.toIList()';
  }

  @override
  String serializeToList(String expression, DartType resolvedGenericType,
      bool isExpressionNullable) {
    // not needed as IList implements Iterable
    throw UnimplementedError();
  }
}

class FICISetTypeHelper extends CustomIterableTypeHelper<ISet> {
  @override
  String deserializeFromIterableExpression(
      String expression, DartType resolvedGenericType) {
    return expression + '.toISet()';
  }

  @override
  String serializeToList(String expression, DartType resolvedGenericType,
      bool isExpressionNullable) {
    // not needed as IList implements Iterable
    throw UnimplementedError();
  }
}

class FICIMapTypeHelper extends CustomMapTypeHelper<IMap> {
  @override
  String deserializeFromMapExpression(
      String mapExpression, DartType keyType, DartType valueType) {
    return '$mapExpression.toIMap()';
  }

  @override
  String serializeToMapExpression(String mapExpression, DartType keyType,
      DartType valueType, bool isMapExpressionNullable) {
    final optionalQuestion = isMapExpressionNullable ? '?' : '';
    return mapExpression + optionalQuestion + '.unlockLazy';
  }
}
