import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'simple_object.dart';

part 'nested_values.g.dart';

abstract class SimpleValueContainer
    implements Built<SimpleValueContainer, SimpleValueContainerBuilder> {
  SimpleValueContainer._();
  factory SimpleValueContainer([updates(SimpleValueContainerBuilder b)]) =
      _$SimpleValueContainer;

  static Serializer<SimpleValueContainer> get serializer =>
      _$simpleValueContainerSerializer;

  SimpleValue get simpleValue;

  int get anInt;
}
