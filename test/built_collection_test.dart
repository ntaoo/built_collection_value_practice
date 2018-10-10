import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';

import '../bin/simple_object.dart';

void main() {
  group('Enjoy immutablility with Built Collection.', () {
    builtListTests();

    group('BuiltMap', () {
      // Omitted, as it has the same features to BuiltList.
    });
    group('BuiltSet', () {
      // Omitted, as it has the same features to BuiltList.
    });
  });
}

void builtListTests() {
  group('BuiltList.', () {
    test('Standard List is mutable.', () {
      final c = C('a');
      final l1 = [c];
      final l2 = List.from(l1);

      expect(l1 == l2, isFalse, reason: 'Shallow comparison.');
      expect(l1.first == l2.first, isTrue,
          reason: 'They share the same element.');

      c.name = 'b';

      expect(l1.first == l2.first, isTrue,
          reason: 'They share the same element.');
      expect(l2.first.name, 'b', reason: 'They share the same element.');
    });

    test(
        'BuiltList provides deep comparison, but the non BuiltValue elements can still be mutable.',
        () {
      final c = C('a');
      final l = [c];
      final l1 = BuiltList<C>.from(l);
      final l2 = BuiltList<C>.from(l);

      expect(l1 == l2, isTrue, reason: 'thanks to the deep comparison.');
      expect(l1.first == l2.first, isTrue, reason: 'they share same element.');

      c.name = 'b';

      expect(l1.first == l2.first, isTrue, reason: 'they share same element.');
      expect(l2.first.name, 'b',
          reason:
              'mutated, because they share the same mutable element. NOT recommended.');
    });

    test('BuiltList can be deeply immutable with built values.', () {
      SimpleValue buildValue() {
        return SimpleValue((b) => b
          ..anInt = 1
          ..aString = 'a'
          ..aListOfStrings = ListBuilder<String>(['one', 'two', 'three']));
      }

      final l1 = BuiltList<SimpleValue>.from([buildValue()]);
      final l2 = BuiltList<SimpleValue>.from([buildValue()]);

      expect(l1 == l2, isTrue, reason: 'thanks to the deep comparison.');
      expect(l1.first == l2.first, isTrue, reason: 'value comparison.');

      final l3 =
          l2.rebuild((b) => b.first = b.first.rebuild((b) => b..aString = 'b'));

      expect(l2 == l3, isTrue);
      expect(l1 == l2, isFalse, reason: 'l2 was rebuilt.');
      expect(l1 == l3, isFalse, reason: 'l3 is l2.');
      expect(l2.first.aString, 'b');
      expect(l3.first.aString, 'b');
    });

    test('BuiltList is not a List, but an Iterable', () {
      expect(BuiltList<int>([1]), isNot(isList));
      expect(BuiltList<int>([1]) is Iterable, isTrue);
    });

    test('BuiltList can return self as standard Immutable List', () {
      final list = BuiltList<int>([1, 2, 3]).asList();
      expect(() => list.add(4), throwsA(TypeMatcher<UnsupportedError>()));
      expect(() => list.first = 4, throwsA(TypeMatcher<UnsupportedError>()));
    });

    test('BuiltList basics 1', () {
      final list = BuiltList<int>([1, 2, 3]);
      expect(list is! List, isTrue);

      final updatedList = (list.toBuilder()..add(4)..add(5)).build();
      expect(updatedList, BuiltList<int>([1, 2, 3, 4, 5]));

      final updatedMoreList =
          (updatedList.toBuilder()..where((x) => (x > 2))).build();
      expect(updatedMoreList, BuiltList<int>([3, 4, 5]));
    });

    test('With Set.', () {
      // BuiltList
      final lists = Set<BuiltList<int>>();

      lists.add(BuiltList<int>([1, 2, 3]));
      expect(lists, hasLength(1));

      lists.add(BuiltList<int>([1, 2, 3]));
      expect(lists, hasLength(1), reason: 'deeply comparable.');

      // List
      final mutableLists = Set<List<int>>();

      mutableLists.add([1, 2, 3]);
      expect(mutableLists, hasLength(1));

      mutableLists.add([1, 2, 3]);
      expect(mutableLists, hasLength(2));
    });

    test('BuiltList is non nullable', () {
      expect(() => BuiltList<int>([null]), throwsArgumentError,
          reason: 'null is not allowed');
    });
  });
}

class C {
  C(this.name);
  String name;
}
