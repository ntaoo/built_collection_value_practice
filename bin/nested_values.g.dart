// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_values.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<SimpleValueContainer> _$simpleValueContainerSerializer =
    new _$SimpleValueContainerSerializer();

class _$SimpleValueContainerSerializer
    implements StructuredSerializer<SimpleValueContainer> {
  @override
  final Iterable<Type> types = const [
    SimpleValueContainer,
    _$SimpleValueContainer
  ];
  @override
  final String wireName = 'SimpleValueContainer';

  @override
  Iterable serialize(Serializers serializers, SimpleValueContainer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'simpleValue',
      serializers.serialize(object.simpleValue,
          specifiedType: const FullType(SimpleValue)),
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SimpleValueContainer deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SimpleValueContainerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'simpleValue':
          result.simpleValue.replace(serializers.deserialize(value,
              specifiedType: const FullType(SimpleValue)) as SimpleValue);
          break;
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SimpleValueContainer extends SimpleValueContainer {
  @override
  final SimpleValue simpleValue;
  @override
  final int anInt;

  factory _$SimpleValueContainer(
          [void updates(SimpleValueContainerBuilder b)]) =>
      (new SimpleValueContainerBuilder()..update(updates)).build();

  _$SimpleValueContainer._({this.simpleValue, this.anInt}) : super._() {
    if (simpleValue == null) {
      throw new BuiltValueNullFieldError('SimpleValueContainer', 'simpleValue');
    }
    if (anInt == null) {
      throw new BuiltValueNullFieldError('SimpleValueContainer', 'anInt');
    }
  }

  @override
  SimpleValueContainer rebuild(void updates(SimpleValueContainerBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueContainerBuilder toBuilder() =>
      new SimpleValueContainerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleValueContainer &&
        simpleValue == other.simpleValue &&
        anInt == other.anInt;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), anInt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SimpleValueContainer')
          ..add('simpleValue', simpleValue)
          ..add('anInt', anInt))
        .toString();
  }
}

class SimpleValueContainerBuilder
    implements Builder<SimpleValueContainer, SimpleValueContainerBuilder> {
  _$SimpleValueContainer _$v;

  SimpleValueBuilder _simpleValue;
  SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder simpleValue) =>
      _$this._simpleValue = simpleValue;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  SimpleValueContainerBuilder();

  SimpleValueContainerBuilder get _$this {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue?.toBuilder();
      _anInt = _$v.anInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValueContainer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SimpleValueContainer;
  }

  @override
  void update(void updates(SimpleValueContainerBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SimpleValueContainer build() {
    _$SimpleValueContainer _$result;
    try {
      _$result = _$v ??
          new _$SimpleValueContainer._(
              simpleValue: simpleValue.build(), anInt: anInt);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SimpleValueContainer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
