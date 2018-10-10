import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:test/test.dart';

import 'package:built_collection_value_practice/nested_values.dart';
import 'package:built_collection_value_practice/serializers.dart';
import 'package:built_collection_value_practice/simple_object.dart';

void main() {
  group('Enjoy BuiltValue.', () {
    group('SimpleValue', () {
      SimpleValue build() {
        return SimpleValue((b) => b
          ..anInt = 1
          ..aString = 'a'
          ..aListOfStrings = ListBuilder<String>(['one', 'two', 'three']));
      }

      test('It is a value.', () {
        final s1 = build();
        expect(s1.anInt, 1);
        expect(s1.aString, 'a');
        expect(s1.aListOfStrings, ['one', 'two', 'three']);
        expect(s1.aListOfStrings, BuiltList<String>(['one', 'two', 'three']));

        final s2 = build();
        expect(s1, s2);
      });

      test('can allow null value only with nullable annotation.', () {
        final s1 = SimpleValue((b) => b
          ..anInt = 1
          ..aString = null
          ..aListOfStrings = ListBuilder<String>(['one', 'two', 'three']));
        expect(s1.aString, isNull);

        expect(
            () => SimpleValue((b) => b
              ..anInt = null
              ..aString = null
              ..aListOfStrings = ListBuilder<String>(['one', 'two', 'three'])),
            throwsA(TypeMatcher<BuiltValueNullFieldError>()));
      });

      test('can rebuild', () {
        final s1 = build();
        final s2 = s1.rebuild((b) => b
          ..anInt = 2
          ..aString = 'b');

        expect(s1 == s2, isFalse);
        expect(s2.anInt, 2);
        expect(s2.aString, 'b');
        expect(s2.aListOfStrings, BuiltList<String>(['one', 'two', 'three']),
            reason: 'it still holds the privious value.');
      });

      test('can serialize to json Map.', () {
        final s1 = build();
        final result = standardSerializers.serialize(s1);
        expect(result is String, isFalse);
        expect(result is Map, isTrue);
        expect((result as Map)['\$'], 'SimpleValue');
        expect((result as Map).keys.toSet(),
            Set.from(['\$', 'aString', 'anInt', 'aListOfStrings']));
        expect((result as Map)['aListOfStrings'], isList);
      });

      test('can serialize to json Map, with familiar format.', () {
        final s1 = build();
        final result = standardSerializers.serializeWith<SimpleValue>(
            SimpleValue.serializer, s1);

        expect(result is String, isFalse);
        expect(result is Map, isTrue);
        expect((result as Map).containsKey('\$'), isFalse);
        expect((result as Map).keys.toSet(),
            Set.from(['aString', 'anInt', 'aListOfStrings']));
        expect((result as Map)['aListOfStrings'], isList);
      });
    });

    group('NestedValue', () {
      SimpleValueContainer build() {
        return SimpleValueContainer((b) => b
          ..simpleValue.aString = 'a'
          ..simpleValue.anInt = 1
          ..anInt = 1);
      }

      test('can build nested values.', () {
        final c1 = build();
        expect(c1.anInt, 1);
        expect(c1.simpleValue.anInt, 1);
        expect(c1.simpleValue.aString, 'a');
      });

      test('can rebuild nested values.', () {
        final c1 = build();
        final c2 = c1.rebuild((b) => b
          ..simpleValue.anInt = 2
          ..simpleValue.aString = 'b');
        expect(c1 == c2, isFalse);
        expect(c2.anInt, 1, reason: 'it still holds the previous value.');
        expect(c2.simpleValue.anInt, 2);
        expect(c2.simpleValue.aString, 'b');
      });

      test('can serialize to json Map..', () {
        final c1 = build();
        final result = standardSerializers.serializeWith<SimpleValueContainer>(
            SimpleValueContainer.serializer, c1);
        expect(result is String, isFalse);
        expect(result is Map, isTrue);
      });
    });
  });
}
