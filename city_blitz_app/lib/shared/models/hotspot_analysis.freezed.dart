// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotspot_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotspotAnalysis {

 String get timestamp; String get agent; List<Hotspot> get hotspots;
/// Create a copy of HotspotAnalysis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotspotAnalysisCopyWith<HotspotAnalysis> get copyWith => _$HotspotAnalysisCopyWithImpl<HotspotAnalysis>(this as HotspotAnalysis, _$identity);

  /// Serializes this HotspotAnalysis to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotspotAnalysis&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&const DeepCollectionEquality().equals(other.hotspots, hotspots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,const DeepCollectionEquality().hash(hotspots));

@override
String toString() {
  return 'HotspotAnalysis(timestamp: $timestamp, agent: $agent, hotspots: $hotspots)';
}


}

/// @nodoc
abstract mixin class $HotspotAnalysisCopyWith<$Res>  {
  factory $HotspotAnalysisCopyWith(HotspotAnalysis value, $Res Function(HotspotAnalysis) _then) = _$HotspotAnalysisCopyWithImpl;
@useResult
$Res call({
 String timestamp, String agent, List<Hotspot> hotspots
});




}
/// @nodoc
class _$HotspotAnalysisCopyWithImpl<$Res>
    implements $HotspotAnalysisCopyWith<$Res> {
  _$HotspotAnalysisCopyWithImpl(this._self, this._then);

  final HotspotAnalysis _self;
  final $Res Function(HotspotAnalysis) _then;

/// Create a copy of HotspotAnalysis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? agent = null,Object? hotspots = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,hotspots: null == hotspots ? _self.hotspots : hotspots // ignore: cast_nullable_to_non_nullable
as List<Hotspot>,
  ));
}

}


/// Adds pattern-matching-related methods to [HotspotAnalysis].
extension HotspotAnalysisPatterns on HotspotAnalysis {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotspotAnalysis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotspotAnalysis() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotspotAnalysis value)  $default,){
final _that = this;
switch (_that) {
case _HotspotAnalysis():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotspotAnalysis value)?  $default,){
final _that = this;
switch (_that) {
case _HotspotAnalysis() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String timestamp,  String agent,  List<Hotspot> hotspots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotspotAnalysis() when $default != null:
return $default(_that.timestamp,_that.agent,_that.hotspots);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String timestamp,  String agent,  List<Hotspot> hotspots)  $default,) {final _that = this;
switch (_that) {
case _HotspotAnalysis():
return $default(_that.timestamp,_that.agent,_that.hotspots);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String timestamp,  String agent,  List<Hotspot> hotspots)?  $default,) {final _that = this;
switch (_that) {
case _HotspotAnalysis() when $default != null:
return $default(_that.timestamp,_that.agent,_that.hotspots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotspotAnalysis implements HotspotAnalysis {
  const _HotspotAnalysis({required this.timestamp, required this.agent, final  List<Hotspot> hotspots = const []}): _hotspots = hotspots;
  factory _HotspotAnalysis.fromJson(Map<String, dynamic> json) => _$HotspotAnalysisFromJson(json);

@override final  String timestamp;
@override final  String agent;
 final  List<Hotspot> _hotspots;
@override@JsonKey() List<Hotspot> get hotspots {
  if (_hotspots is EqualUnmodifiableListView) return _hotspots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotspots);
}


/// Create a copy of HotspotAnalysis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotspotAnalysisCopyWith<_HotspotAnalysis> get copyWith => __$HotspotAnalysisCopyWithImpl<_HotspotAnalysis>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotspotAnalysisToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotspotAnalysis&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&const DeepCollectionEquality().equals(other._hotspots, _hotspots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,const DeepCollectionEquality().hash(_hotspots));

@override
String toString() {
  return 'HotspotAnalysis(timestamp: $timestamp, agent: $agent, hotspots: $hotspots)';
}


}

/// @nodoc
abstract mixin class _$HotspotAnalysisCopyWith<$Res> implements $HotspotAnalysisCopyWith<$Res> {
  factory _$HotspotAnalysisCopyWith(_HotspotAnalysis value, $Res Function(_HotspotAnalysis) _then) = __$HotspotAnalysisCopyWithImpl;
@override @useResult
$Res call({
 String timestamp, String agent, List<Hotspot> hotspots
});




}
/// @nodoc
class __$HotspotAnalysisCopyWithImpl<$Res>
    implements _$HotspotAnalysisCopyWith<$Res> {
  __$HotspotAnalysisCopyWithImpl(this._self, this._then);

  final _HotspotAnalysis _self;
  final $Res Function(_HotspotAnalysis) _then;

/// Create a copy of HotspotAnalysis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? agent = null,Object? hotspots = null,}) {
  return _then(_HotspotAnalysis(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,hotspots: null == hotspots ? _self._hotspots : hotspots // ignore: cast_nullable_to_non_nullable
as List<Hotspot>,
  ));
}


}


/// @nodoc
mixin _$Hotspot {

@JsonKey(name: 'zip_code') String get zipCode;@JsonKey(name: 'friction_score') double get frictionScore; HotspotMeta? get meta;
/// Create a copy of Hotspot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotspotCopyWith<Hotspot> get copyWith => _$HotspotCopyWithImpl<Hotspot>(this as Hotspot, _$identity);

  /// Serializes this Hotspot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hotspot&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zipCode,frictionScore,meta);

@override
String toString() {
  return 'Hotspot(zipCode: $zipCode, frictionScore: $frictionScore, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $HotspotCopyWith<$Res>  {
  factory $HotspotCopyWith(Hotspot value, $Res Function(Hotspot) _then) = _$HotspotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'zip_code') String zipCode,@JsonKey(name: 'friction_score') double frictionScore, HotspotMeta? meta
});


$HotspotMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$HotspotCopyWithImpl<$Res>
    implements $HotspotCopyWith<$Res> {
  _$HotspotCopyWithImpl(this._self, this._then);

  final Hotspot _self;
  final $Res Function(Hotspot) _then;

/// Create a copy of Hotspot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? zipCode = null,Object? frictionScore = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as HotspotMeta?,
  ));
}
/// Create a copy of Hotspot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotspotMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $HotspotMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [Hotspot].
extension HotspotPatterns on Hotspot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hotspot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hotspot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hotspot value)  $default,){
final _that = this;
switch (_that) {
case _Hotspot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hotspot value)?  $default,){
final _that = this;
switch (_that) {
case _Hotspot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'zip_code')  String zipCode, @JsonKey(name: 'friction_score')  double frictionScore,  HotspotMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hotspot() when $default != null:
return $default(_that.zipCode,_that.frictionScore,_that.meta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'zip_code')  String zipCode, @JsonKey(name: 'friction_score')  double frictionScore,  HotspotMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _Hotspot():
return $default(_that.zipCode,_that.frictionScore,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'zip_code')  String zipCode, @JsonKey(name: 'friction_score')  double frictionScore,  HotspotMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _Hotspot() when $default != null:
return $default(_that.zipCode,_that.frictionScore,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hotspot implements Hotspot {
  const _Hotspot({@JsonKey(name: 'zip_code') required this.zipCode, @JsonKey(name: 'friction_score') required this.frictionScore, this.meta});
  factory _Hotspot.fromJson(Map<String, dynamic> json) => _$HotspotFromJson(json);

@override@JsonKey(name: 'zip_code') final  String zipCode;
@override@JsonKey(name: 'friction_score') final  double frictionScore;
@override final  HotspotMeta? meta;

/// Create a copy of Hotspot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotspotCopyWith<_Hotspot> get copyWith => __$HotspotCopyWithImpl<_Hotspot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotspotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hotspot&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,zipCode,frictionScore,meta);

@override
String toString() {
  return 'Hotspot(zipCode: $zipCode, frictionScore: $frictionScore, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$HotspotCopyWith<$Res> implements $HotspotCopyWith<$Res> {
  factory _$HotspotCopyWith(_Hotspot value, $Res Function(_Hotspot) _then) = __$HotspotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'zip_code') String zipCode,@JsonKey(name: 'friction_score') double frictionScore, HotspotMeta? meta
});


@override $HotspotMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$HotspotCopyWithImpl<$Res>
    implements _$HotspotCopyWith<$Res> {
  __$HotspotCopyWithImpl(this._self, this._then);

  final _Hotspot _self;
  final $Res Function(_Hotspot) _then;

/// Create a copy of Hotspot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? zipCode = null,Object? frictionScore = null,Object? meta = freezed,}) {
  return _then(_Hotspot(
zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as HotspotMeta?,
  ));
}

/// Create a copy of Hotspot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotspotMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $HotspotMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$HotspotMeta {

@JsonKey(name: 'source_file') String? get sourceFile;
/// Create a copy of HotspotMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotspotMetaCopyWith<HotspotMeta> get copyWith => _$HotspotMetaCopyWithImpl<HotspotMeta>(this as HotspotMeta, _$identity);

  /// Serializes this HotspotMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotspotMeta&&(identical(other.sourceFile, sourceFile) || other.sourceFile == sourceFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceFile);

@override
String toString() {
  return 'HotspotMeta(sourceFile: $sourceFile)';
}


}

/// @nodoc
abstract mixin class $HotspotMetaCopyWith<$Res>  {
  factory $HotspotMetaCopyWith(HotspotMeta value, $Res Function(HotspotMeta) _then) = _$HotspotMetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'source_file') String? sourceFile
});




}
/// @nodoc
class _$HotspotMetaCopyWithImpl<$Res>
    implements $HotspotMetaCopyWith<$Res> {
  _$HotspotMetaCopyWithImpl(this._self, this._then);

  final HotspotMeta _self;
  final $Res Function(HotspotMeta) _then;

/// Create a copy of HotspotMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceFile = freezed,}) {
  return _then(_self.copyWith(
sourceFile: freezed == sourceFile ? _self.sourceFile : sourceFile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotspotMeta].
extension HotspotMetaPatterns on HotspotMeta {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotspotMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotspotMeta() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotspotMeta value)  $default,){
final _that = this;
switch (_that) {
case _HotspotMeta():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotspotMeta value)?  $default,){
final _that = this;
switch (_that) {
case _HotspotMeta() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_file')  String? sourceFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotspotMeta() when $default != null:
return $default(_that.sourceFile);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'source_file')  String? sourceFile)  $default,) {final _that = this;
switch (_that) {
case _HotspotMeta():
return $default(_that.sourceFile);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'source_file')  String? sourceFile)?  $default,) {final _that = this;
switch (_that) {
case _HotspotMeta() when $default != null:
return $default(_that.sourceFile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotspotMeta implements HotspotMeta {
  const _HotspotMeta({@JsonKey(name: 'source_file') this.sourceFile});
  factory _HotspotMeta.fromJson(Map<String, dynamic> json) => _$HotspotMetaFromJson(json);

@override@JsonKey(name: 'source_file') final  String? sourceFile;

/// Create a copy of HotspotMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotspotMetaCopyWith<_HotspotMeta> get copyWith => __$HotspotMetaCopyWithImpl<_HotspotMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotspotMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotspotMeta&&(identical(other.sourceFile, sourceFile) || other.sourceFile == sourceFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceFile);

@override
String toString() {
  return 'HotspotMeta(sourceFile: $sourceFile)';
}


}

/// @nodoc
abstract mixin class _$HotspotMetaCopyWith<$Res> implements $HotspotMetaCopyWith<$Res> {
  factory _$HotspotMetaCopyWith(_HotspotMeta value, $Res Function(_HotspotMeta) _then) = __$HotspotMetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'source_file') String? sourceFile
});




}
/// @nodoc
class __$HotspotMetaCopyWithImpl<$Res>
    implements _$HotspotMetaCopyWith<$Res> {
  __$HotspotMetaCopyWithImpl(this._self, this._then);

  final _HotspotMeta _self;
  final $Res Function(_HotspotMeta) _then;

/// Create a copy of HotspotMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceFile = freezed,}) {
  return _then(_HotspotMeta(
sourceFile: freezed == sourceFile ? _self.sourceFile : sourceFile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
