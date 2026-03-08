// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vibe_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VibeCheck {

 String get timestamp; String get agent; String get job;@JsonKey(name: 'source_file') String get sourceFile;@JsonKey(name: 'hotspots_considered') int get hotspotsConsidered; List<VibeLocation> get locations;
/// Create a copy of VibeCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VibeCheckCopyWith<VibeCheck> get copyWith => _$VibeCheckCopyWithImpl<VibeCheck>(this as VibeCheck, _$identity);

  /// Serializes this VibeCheck to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VibeCheck&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&(identical(other.job, job) || other.job == job)&&(identical(other.sourceFile, sourceFile) || other.sourceFile == sourceFile)&&(identical(other.hotspotsConsidered, hotspotsConsidered) || other.hotspotsConsidered == hotspotsConsidered)&&const DeepCollectionEquality().equals(other.locations, locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,job,sourceFile,hotspotsConsidered,const DeepCollectionEquality().hash(locations));

@override
String toString() {
  return 'VibeCheck(timestamp: $timestamp, agent: $agent, job: $job, sourceFile: $sourceFile, hotspotsConsidered: $hotspotsConsidered, locations: $locations)';
}


}

/// @nodoc
abstract mixin class $VibeCheckCopyWith<$Res>  {
  factory $VibeCheckCopyWith(VibeCheck value, $Res Function(VibeCheck) _then) = _$VibeCheckCopyWithImpl;
@useResult
$Res call({
 String timestamp, String agent, String job,@JsonKey(name: 'source_file') String sourceFile,@JsonKey(name: 'hotspots_considered') int hotspotsConsidered, List<VibeLocation> locations
});




}
/// @nodoc
class _$VibeCheckCopyWithImpl<$Res>
    implements $VibeCheckCopyWith<$Res> {
  _$VibeCheckCopyWithImpl(this._self, this._then);

  final VibeCheck _self;
  final $Res Function(VibeCheck) _then;

/// Create a copy of VibeCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? agent = null,Object? job = null,Object? sourceFile = null,Object? hotspotsConsidered = null,Object? locations = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,sourceFile: null == sourceFile ? _self.sourceFile : sourceFile // ignore: cast_nullable_to_non_nullable
as String,hotspotsConsidered: null == hotspotsConsidered ? _self.hotspotsConsidered : hotspotsConsidered // ignore: cast_nullable_to_non_nullable
as int,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<VibeLocation>,
  ));
}

}


/// Adds pattern-matching-related methods to [VibeCheck].
extension VibeCheckPatterns on VibeCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VibeCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VibeCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VibeCheck value)  $default,){
final _that = this;
switch (_that) {
case _VibeCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VibeCheck value)?  $default,){
final _that = this;
switch (_that) {
case _VibeCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String timestamp,  String agent,  String job, @JsonKey(name: 'source_file')  String sourceFile, @JsonKey(name: 'hotspots_considered')  int hotspotsConsidered,  List<VibeLocation> locations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VibeCheck() when $default != null:
return $default(_that.timestamp,_that.agent,_that.job,_that.sourceFile,_that.hotspotsConsidered,_that.locations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String timestamp,  String agent,  String job, @JsonKey(name: 'source_file')  String sourceFile, @JsonKey(name: 'hotspots_considered')  int hotspotsConsidered,  List<VibeLocation> locations)  $default,) {final _that = this;
switch (_that) {
case _VibeCheck():
return $default(_that.timestamp,_that.agent,_that.job,_that.sourceFile,_that.hotspotsConsidered,_that.locations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String timestamp,  String agent,  String job, @JsonKey(name: 'source_file')  String sourceFile, @JsonKey(name: 'hotspots_considered')  int hotspotsConsidered,  List<VibeLocation> locations)?  $default,) {final _that = this;
switch (_that) {
case _VibeCheck() when $default != null:
return $default(_that.timestamp,_that.agent,_that.job,_that.sourceFile,_that.hotspotsConsidered,_that.locations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VibeCheck implements VibeCheck {
  const _VibeCheck({required this.timestamp, required this.agent, required this.job, @JsonKey(name: 'source_file') required this.sourceFile, @JsonKey(name: 'hotspots_considered') required this.hotspotsConsidered, final  List<VibeLocation> locations = const []}): _locations = locations;
  factory _VibeCheck.fromJson(Map<String, dynamic> json) => _$VibeCheckFromJson(json);

@override final  String timestamp;
@override final  String agent;
@override final  String job;
@override@JsonKey(name: 'source_file') final  String sourceFile;
@override@JsonKey(name: 'hotspots_considered') final  int hotspotsConsidered;
 final  List<VibeLocation> _locations;
@override@JsonKey() List<VibeLocation> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}


/// Create a copy of VibeCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VibeCheckCopyWith<_VibeCheck> get copyWith => __$VibeCheckCopyWithImpl<_VibeCheck>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VibeCheckToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VibeCheck&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&(identical(other.job, job) || other.job == job)&&(identical(other.sourceFile, sourceFile) || other.sourceFile == sourceFile)&&(identical(other.hotspotsConsidered, hotspotsConsidered) || other.hotspotsConsidered == hotspotsConsidered)&&const DeepCollectionEquality().equals(other._locations, _locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,job,sourceFile,hotspotsConsidered,const DeepCollectionEquality().hash(_locations));

@override
String toString() {
  return 'VibeCheck(timestamp: $timestamp, agent: $agent, job: $job, sourceFile: $sourceFile, hotspotsConsidered: $hotspotsConsidered, locations: $locations)';
}


}

/// @nodoc
abstract mixin class _$VibeCheckCopyWith<$Res> implements $VibeCheckCopyWith<$Res> {
  factory _$VibeCheckCopyWith(_VibeCheck value, $Res Function(_VibeCheck) _then) = __$VibeCheckCopyWithImpl;
@override @useResult
$Res call({
 String timestamp, String agent, String job,@JsonKey(name: 'source_file') String sourceFile,@JsonKey(name: 'hotspots_considered') int hotspotsConsidered, List<VibeLocation> locations
});




}
/// @nodoc
class __$VibeCheckCopyWithImpl<$Res>
    implements _$VibeCheckCopyWith<$Res> {
  __$VibeCheckCopyWithImpl(this._self, this._then);

  final _VibeCheck _self;
  final $Res Function(_VibeCheck) _then;

/// Create a copy of VibeCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? agent = null,Object? job = null,Object? sourceFile = null,Object? hotspotsConsidered = null,Object? locations = null,}) {
  return _then(_VibeCheck(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,sourceFile: null == sourceFile ? _self.sourceFile : sourceFile // ignore: cast_nullable_to_non_nullable
as String,hotspotsConsidered: null == hotspotsConsidered ? _self.hotspotsConsidered : hotspotsConsidered // ignore: cast_nullable_to_non_nullable
as int,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<VibeLocation>,
  ));
}


}


/// @nodoc
mixin _$VibeLocation {

 String get location;@JsonKey(name: 'vibe_score') double get vibeScore;@JsonKey(name: 'friction_score') double get frictionScore; String get priority;@JsonKey(name: 'raw_hotspot') Map<String, dynamic>? get rawHotspot;
/// Create a copy of VibeLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VibeLocationCopyWith<VibeLocation> get copyWith => _$VibeLocationCopyWithImpl<VibeLocation>(this as VibeLocation, _$identity);

  /// Serializes this VibeLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VibeLocation&&(identical(other.location, location) || other.location == location)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.rawHotspot, rawHotspot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,vibeScore,frictionScore,priority,const DeepCollectionEquality().hash(rawHotspot));

@override
String toString() {
  return 'VibeLocation(location: $location, vibeScore: $vibeScore, frictionScore: $frictionScore, priority: $priority, rawHotspot: $rawHotspot)';
}


}

/// @nodoc
abstract mixin class $VibeLocationCopyWith<$Res>  {
  factory $VibeLocationCopyWith(VibeLocation value, $Res Function(VibeLocation) _then) = _$VibeLocationCopyWithImpl;
@useResult
$Res call({
 String location,@JsonKey(name: 'vibe_score') double vibeScore,@JsonKey(name: 'friction_score') double frictionScore, String priority,@JsonKey(name: 'raw_hotspot') Map<String, dynamic>? rawHotspot
});




}
/// @nodoc
class _$VibeLocationCopyWithImpl<$Res>
    implements $VibeLocationCopyWith<$Res> {
  _$VibeLocationCopyWithImpl(this._self, this._then);

  final VibeLocation _self;
  final $Res Function(VibeLocation) _then;

/// Create a copy of VibeLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = null,Object? vibeScore = null,Object? frictionScore = null,Object? priority = null,Object? rawHotspot = freezed,}) {
  return _then(_self.copyWith(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,vibeScore: null == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,rawHotspot: freezed == rawHotspot ? _self.rawHotspot : rawHotspot // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [VibeLocation].
extension VibeLocationPatterns on VibeLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VibeLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VibeLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VibeLocation value)  $default,){
final _that = this;
switch (_that) {
case _VibeLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VibeLocation value)?  $default,){
final _that = this;
switch (_that) {
case _VibeLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String location, @JsonKey(name: 'vibe_score')  double vibeScore, @JsonKey(name: 'friction_score')  double frictionScore,  String priority, @JsonKey(name: 'raw_hotspot')  Map<String, dynamic>? rawHotspot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VibeLocation() when $default != null:
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.priority,_that.rawHotspot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String location, @JsonKey(name: 'vibe_score')  double vibeScore, @JsonKey(name: 'friction_score')  double frictionScore,  String priority, @JsonKey(name: 'raw_hotspot')  Map<String, dynamic>? rawHotspot)  $default,) {final _that = this;
switch (_that) {
case _VibeLocation():
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.priority,_that.rawHotspot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String location, @JsonKey(name: 'vibe_score')  double vibeScore, @JsonKey(name: 'friction_score')  double frictionScore,  String priority, @JsonKey(name: 'raw_hotspot')  Map<String, dynamic>? rawHotspot)?  $default,) {final _that = this;
switch (_that) {
case _VibeLocation() when $default != null:
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.priority,_that.rawHotspot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VibeLocation implements VibeLocation {
  const _VibeLocation({required this.location, @JsonKey(name: 'vibe_score') required this.vibeScore, @JsonKey(name: 'friction_score') required this.frictionScore, required this.priority, @JsonKey(name: 'raw_hotspot') final  Map<String, dynamic>? rawHotspot}): _rawHotspot = rawHotspot;
  factory _VibeLocation.fromJson(Map<String, dynamic> json) => _$VibeLocationFromJson(json);

@override final  String location;
@override@JsonKey(name: 'vibe_score') final  double vibeScore;
@override@JsonKey(name: 'friction_score') final  double frictionScore;
@override final  String priority;
 final  Map<String, dynamic>? _rawHotspot;
@override@JsonKey(name: 'raw_hotspot') Map<String, dynamic>? get rawHotspot {
  final value = _rawHotspot;
  if (value == null) return null;
  if (_rawHotspot is EqualUnmodifiableMapView) return _rawHotspot;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of VibeLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VibeLocationCopyWith<_VibeLocation> get copyWith => __$VibeLocationCopyWithImpl<_VibeLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VibeLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VibeLocation&&(identical(other.location, location) || other.location == location)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other._rawHotspot, _rawHotspot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,vibeScore,frictionScore,priority,const DeepCollectionEquality().hash(_rawHotspot));

@override
String toString() {
  return 'VibeLocation(location: $location, vibeScore: $vibeScore, frictionScore: $frictionScore, priority: $priority, rawHotspot: $rawHotspot)';
}


}

/// @nodoc
abstract mixin class _$VibeLocationCopyWith<$Res> implements $VibeLocationCopyWith<$Res> {
  factory _$VibeLocationCopyWith(_VibeLocation value, $Res Function(_VibeLocation) _then) = __$VibeLocationCopyWithImpl;
@override @useResult
$Res call({
 String location,@JsonKey(name: 'vibe_score') double vibeScore,@JsonKey(name: 'friction_score') double frictionScore, String priority,@JsonKey(name: 'raw_hotspot') Map<String, dynamic>? rawHotspot
});




}
/// @nodoc
class __$VibeLocationCopyWithImpl<$Res>
    implements _$VibeLocationCopyWith<$Res> {
  __$VibeLocationCopyWithImpl(this._self, this._then);

  final _VibeLocation _self;
  final $Res Function(_VibeLocation) _then;

/// Create a copy of VibeLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = null,Object? vibeScore = null,Object? frictionScore = null,Object? priority = null,Object? rawHotspot = freezed,}) {
  return _then(_VibeLocation(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,vibeScore: null == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,rawHotspot: freezed == rawHotspot ? _self._rawHotspot : rawHotspot // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
