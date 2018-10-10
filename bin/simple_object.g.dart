// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_object.dart';

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

Serializer<SimpleValue> _$simpleValueSerializer = new _$SimpleValueSerializer();

class _$SimpleValueSerializer implements StructuredSerializer<SimpleValue> {
  @override
  final Iterable<Type> types = const [SimpleValue, _$SimpleValue];
  @override
  final String wireName = 'SimpleValue';

  @override
  Iterable serialize(Serializers serializers, SimpleValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'aListOfStrings',
      serializers.serialize(object.aListOfStrings,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.aString != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(object.aString,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  SimpleValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SimpleValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'aListOfStrings':
          result.aListOfStrings.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final String aString;
  @override
  final BuiltList<String> aListOfStrings;

  factory _$SimpleValue([void updates(SimpleValueBuilder b)]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({this.anInt, this.aString, this.aListOfStrings}) : super._() {
    if (anInt == null) {
      throw new BuiltValueNullFieldError('SimpleValue', 'anInt');
    }
    if (aListOfStrings == null) {
      throw new BuiltValueNullFieldError('SimpleValue', 'aListOfStrings');
    }
  }

  @override
  SimpleValue rebuild(void updates(SimpleValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleValue &&
        anInt == other.anInt &&
        aString == other.aString &&
        aListOfStrings == other.aListOfStrings;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, anInt.hashCode), aString.hashCode),
        aListOfStrings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SimpleValue')
          ..add('anInt', anInt)
          ..add('aString', aString)
          ..add('aListOfStrings', aListOfStrings))
        .toString();
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  ListBuilder<String> _aListOfStrings;
  ListBuilder<String> get aListOfStrings =>
      _$this._aListOfStrings ??= new ListBuilder<String>();
  set aListOfStrings(ListBuilder<String> aListOfStrings) =>
      _$this._aListOfStrings = aListOfStrings;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _aListOfStrings = _$v.aListOfStrings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void updates(SimpleValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SimpleValue build() {
    _$SimpleValue _$result;
    try {
      _$result = _$v ??
          new _$SimpleValue._(
              anInt: anInt,
              aString: aString,
              aListOfStrings: aListOfStrings.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'aListOfStrings';
        aListOfStrings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SimpleValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
