import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'simple_object.g.dart';

abstract class SimpleValue implements Built<SimpleValue, SimpleValueBuilder> {
  static Serializer<SimpleValue> get serializer => _$simpleValueSerializer;
  int get anInt;

  @nullable
  String get aString;

  BuiltList<String> get aListOfStrings;

  // Usually not necessary.
  factory SimpleValue.familiarNamed(
      {@required int anInt,
      @required String aString,
      @required BuiltList<String> aListOfStrings}) {
    return SimpleValue((b) => b
      ..anInt = anInt
      ..aString = aString
      ..aListOfStrings = aListOfStrings.toBuilder());
  }

  SimpleValue._();

  factory SimpleValue([updates(SimpleValueBuilder b)]) = _$SimpleValue;
}
