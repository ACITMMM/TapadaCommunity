// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailServiceModel {
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailServiceModelCopyWith<DetailServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailServiceModelCopyWith<$Res> {
  factory $DetailServiceModelCopyWith(
          DetailServiceModel value, $Res Function(DetailServiceModel) then) =
      _$DetailServiceModelCopyWithImpl<$Res, DetailServiceModel>;
  @useResult
  $Res call({String title, String subtitle, String desc});
}

/// @nodoc
class _$DetailServiceModelCopyWithImpl<$Res, $Val extends DetailServiceModel>
    implements $DetailServiceModelCopyWith<$Res> {
  _$DetailServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? desc = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailServiceModelImplCopyWith<$Res>
    implements $DetailServiceModelCopyWith<$Res> {
  factory _$$DetailServiceModelImplCopyWith(_$DetailServiceModelImpl value,
          $Res Function(_$DetailServiceModelImpl) then) =
      __$$DetailServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String subtitle, String desc});
}

/// @nodoc
class __$$DetailServiceModelImplCopyWithImpl<$Res>
    extends _$DetailServiceModelCopyWithImpl<$Res, _$DetailServiceModelImpl>
    implements _$$DetailServiceModelImplCopyWith<$Res> {
  __$$DetailServiceModelImplCopyWithImpl(_$DetailServiceModelImpl _value,
      $Res Function(_$DetailServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
    Object? desc = null,
  }) {
    return _then(_$DetailServiceModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailServiceModelImpl implements _DetailServiceModel {
  const _$DetailServiceModelImpl(
      {required this.title, required this.subtitle, required this.desc});

  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String desc;

  @override
  String toString() {
    return 'DetailServiceModel(title: $title, subtitle: $subtitle, desc: $desc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailServiceModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle, desc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailServiceModelImplCopyWith<_$DetailServiceModelImpl> get copyWith =>
      __$$DetailServiceModelImplCopyWithImpl<_$DetailServiceModelImpl>(
          this, _$identity);
}

abstract class _DetailServiceModel implements DetailServiceModel {
  const factory _DetailServiceModel(
      {required final String title,
      required final String subtitle,
      required final String desc}) = _$DetailServiceModelImpl;

  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get desc;
  @override
  @JsonKey(ignore: true)
  _$$DetailServiceModelImplCopyWith<_$DetailServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
