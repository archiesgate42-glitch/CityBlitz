// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'priority_roadmap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PriorityRoadmap {

 String get timestamp; String get agent; String get phase; String get status;@JsonKey(name: 'red_zone') RedZone? get redZone;@JsonKey(name: 'command_verdict') String get commandVerdict; RoadmapAps? get aps; Consensus? get consensus; Explainability? get explainability;@JsonKey(name: 'source_reports') Map<String, String>? get sourceReports;@JsonKey(name: 'cascade_failure') Map<String, dynamic>? get cascadeFailure;
/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriorityRoadmapCopyWith<PriorityRoadmap> get copyWith => _$PriorityRoadmapCopyWithImpl<PriorityRoadmap>(this as PriorityRoadmap, _$identity);

  /// Serializes this PriorityRoadmap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriorityRoadmap&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.status, status) || other.status == status)&&(identical(other.redZone, redZone) || other.redZone == redZone)&&(identical(other.commandVerdict, commandVerdict) || other.commandVerdict == commandVerdict)&&(identical(other.aps, aps) || other.aps == aps)&&(identical(other.consensus, consensus) || other.consensus == consensus)&&(identical(other.explainability, explainability) || other.explainability == explainability)&&const DeepCollectionEquality().equals(other.sourceReports, sourceReports)&&const DeepCollectionEquality().equals(other.cascadeFailure, cascadeFailure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,phase,status,redZone,commandVerdict,aps,consensus,explainability,const DeepCollectionEquality().hash(sourceReports),const DeepCollectionEquality().hash(cascadeFailure));

@override
String toString() {
  return 'PriorityRoadmap(timestamp: $timestamp, agent: $agent, phase: $phase, status: $status, redZone: $redZone, commandVerdict: $commandVerdict, aps: $aps, consensus: $consensus, explainability: $explainability, sourceReports: $sourceReports, cascadeFailure: $cascadeFailure)';
}


}

/// @nodoc
abstract mixin class $PriorityRoadmapCopyWith<$Res>  {
  factory $PriorityRoadmapCopyWith(PriorityRoadmap value, $Res Function(PriorityRoadmap) _then) = _$PriorityRoadmapCopyWithImpl;
@useResult
$Res call({
 String timestamp, String agent, String phase, String status,@JsonKey(name: 'red_zone') RedZone? redZone,@JsonKey(name: 'command_verdict') String commandVerdict, RoadmapAps? aps, Consensus? consensus, Explainability? explainability,@JsonKey(name: 'source_reports') Map<String, String>? sourceReports,@JsonKey(name: 'cascade_failure') Map<String, dynamic>? cascadeFailure
});


$RedZoneCopyWith<$Res>? get redZone;$RoadmapApsCopyWith<$Res>? get aps;$ConsensusCopyWith<$Res>? get consensus;$ExplainabilityCopyWith<$Res>? get explainability;

}
/// @nodoc
class _$PriorityRoadmapCopyWithImpl<$Res>
    implements $PriorityRoadmapCopyWith<$Res> {
  _$PriorityRoadmapCopyWithImpl(this._self, this._then);

  final PriorityRoadmap _self;
  final $Res Function(PriorityRoadmap) _then;

/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? agent = null,Object? phase = null,Object? status = null,Object? redZone = freezed,Object? commandVerdict = null,Object? aps = freezed,Object? consensus = freezed,Object? explainability = freezed,Object? sourceReports = freezed,Object? cascadeFailure = freezed,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,redZone: freezed == redZone ? _self.redZone : redZone // ignore: cast_nullable_to_non_nullable
as RedZone?,commandVerdict: null == commandVerdict ? _self.commandVerdict : commandVerdict // ignore: cast_nullable_to_non_nullable
as String,aps: freezed == aps ? _self.aps : aps // ignore: cast_nullable_to_non_nullable
as RoadmapAps?,consensus: freezed == consensus ? _self.consensus : consensus // ignore: cast_nullable_to_non_nullable
as Consensus?,explainability: freezed == explainability ? _self.explainability : explainability // ignore: cast_nullable_to_non_nullable
as Explainability?,sourceReports: freezed == sourceReports ? _self.sourceReports : sourceReports // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,cascadeFailure: freezed == cascadeFailure ? _self.cascadeFailure : cascadeFailure // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RedZoneCopyWith<$Res>? get redZone {
    if (_self.redZone == null) {
    return null;
  }

  return $RedZoneCopyWith<$Res>(_self.redZone!, (value) {
    return _then(_self.copyWith(redZone: value));
  });
}/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapApsCopyWith<$Res>? get aps {
    if (_self.aps == null) {
    return null;
  }

  return $RoadmapApsCopyWith<$Res>(_self.aps!, (value) {
    return _then(_self.copyWith(aps: value));
  });
}/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsensusCopyWith<$Res>? get consensus {
    if (_self.consensus == null) {
    return null;
  }

  return $ConsensusCopyWith<$Res>(_self.consensus!, (value) {
    return _then(_self.copyWith(consensus: value));
  });
}/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExplainabilityCopyWith<$Res>? get explainability {
    if (_self.explainability == null) {
    return null;
  }

  return $ExplainabilityCopyWith<$Res>(_self.explainability!, (value) {
    return _then(_self.copyWith(explainability: value));
  });
}
}


/// Adds pattern-matching-related methods to [PriorityRoadmap].
extension PriorityRoadmapPatterns on PriorityRoadmap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriorityRoadmap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriorityRoadmap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriorityRoadmap value)  $default,){
final _that = this;
switch (_that) {
case _PriorityRoadmap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriorityRoadmap value)?  $default,){
final _that = this;
switch (_that) {
case _PriorityRoadmap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String timestamp,  String agent,  String phase,  String status, @JsonKey(name: 'red_zone')  RedZone? redZone, @JsonKey(name: 'command_verdict')  String commandVerdict,  RoadmapAps? aps,  Consensus? consensus,  Explainability? explainability, @JsonKey(name: 'source_reports')  Map<String, String>? sourceReports, @JsonKey(name: 'cascade_failure')  Map<String, dynamic>? cascadeFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriorityRoadmap() when $default != null:
return $default(_that.timestamp,_that.agent,_that.phase,_that.status,_that.redZone,_that.commandVerdict,_that.aps,_that.consensus,_that.explainability,_that.sourceReports,_that.cascadeFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String timestamp,  String agent,  String phase,  String status, @JsonKey(name: 'red_zone')  RedZone? redZone, @JsonKey(name: 'command_verdict')  String commandVerdict,  RoadmapAps? aps,  Consensus? consensus,  Explainability? explainability, @JsonKey(name: 'source_reports')  Map<String, String>? sourceReports, @JsonKey(name: 'cascade_failure')  Map<String, dynamic>? cascadeFailure)  $default,) {final _that = this;
switch (_that) {
case _PriorityRoadmap():
return $default(_that.timestamp,_that.agent,_that.phase,_that.status,_that.redZone,_that.commandVerdict,_that.aps,_that.consensus,_that.explainability,_that.sourceReports,_that.cascadeFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String timestamp,  String agent,  String phase,  String status, @JsonKey(name: 'red_zone')  RedZone? redZone, @JsonKey(name: 'command_verdict')  String commandVerdict,  RoadmapAps? aps,  Consensus? consensus,  Explainability? explainability, @JsonKey(name: 'source_reports')  Map<String, String>? sourceReports, @JsonKey(name: 'cascade_failure')  Map<String, dynamic>? cascadeFailure)?  $default,) {final _that = this;
switch (_that) {
case _PriorityRoadmap() when $default != null:
return $default(_that.timestamp,_that.agent,_that.phase,_that.status,_that.redZone,_that.commandVerdict,_that.aps,_that.consensus,_that.explainability,_that.sourceReports,_that.cascadeFailure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriorityRoadmap implements PriorityRoadmap {
  const _PriorityRoadmap({required this.timestamp, required this.agent, required this.phase, required this.status, @JsonKey(name: 'red_zone') this.redZone, @JsonKey(name: 'command_verdict') required this.commandVerdict, this.aps, this.consensus, this.explainability, @JsonKey(name: 'source_reports') final  Map<String, String>? sourceReports, @JsonKey(name: 'cascade_failure') final  Map<String, dynamic>? cascadeFailure}): _sourceReports = sourceReports,_cascadeFailure = cascadeFailure;
  factory _PriorityRoadmap.fromJson(Map<String, dynamic> json) => _$PriorityRoadmapFromJson(json);

@override final  String timestamp;
@override final  String agent;
@override final  String phase;
@override final  String status;
@override@JsonKey(name: 'red_zone') final  RedZone? redZone;
@override@JsonKey(name: 'command_verdict') final  String commandVerdict;
@override final  RoadmapAps? aps;
@override final  Consensus? consensus;
@override final  Explainability? explainability;
 final  Map<String, String>? _sourceReports;
@override@JsonKey(name: 'source_reports') Map<String, String>? get sourceReports {
  final value = _sourceReports;
  if (value == null) return null;
  if (_sourceReports is EqualUnmodifiableMapView) return _sourceReports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _cascadeFailure;
@override@JsonKey(name: 'cascade_failure') Map<String, dynamic>? get cascadeFailure {
  final value = _cascadeFailure;
  if (value == null) return null;
  if (_cascadeFailure is EqualUnmodifiableMapView) return _cascadeFailure;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriorityRoadmapCopyWith<_PriorityRoadmap> get copyWith => __$PriorityRoadmapCopyWithImpl<_PriorityRoadmap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriorityRoadmapToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriorityRoadmap&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.status, status) || other.status == status)&&(identical(other.redZone, redZone) || other.redZone == redZone)&&(identical(other.commandVerdict, commandVerdict) || other.commandVerdict == commandVerdict)&&(identical(other.aps, aps) || other.aps == aps)&&(identical(other.consensus, consensus) || other.consensus == consensus)&&(identical(other.explainability, explainability) || other.explainability == explainability)&&const DeepCollectionEquality().equals(other._sourceReports, _sourceReports)&&const DeepCollectionEquality().equals(other._cascadeFailure, _cascadeFailure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,phase,status,redZone,commandVerdict,aps,consensus,explainability,const DeepCollectionEquality().hash(_sourceReports),const DeepCollectionEquality().hash(_cascadeFailure));

@override
String toString() {
  return 'PriorityRoadmap(timestamp: $timestamp, agent: $agent, phase: $phase, status: $status, redZone: $redZone, commandVerdict: $commandVerdict, aps: $aps, consensus: $consensus, explainability: $explainability, sourceReports: $sourceReports, cascadeFailure: $cascadeFailure)';
}


}

/// @nodoc
abstract mixin class _$PriorityRoadmapCopyWith<$Res> implements $PriorityRoadmapCopyWith<$Res> {
  factory _$PriorityRoadmapCopyWith(_PriorityRoadmap value, $Res Function(_PriorityRoadmap) _then) = __$PriorityRoadmapCopyWithImpl;
@override @useResult
$Res call({
 String timestamp, String agent, String phase, String status,@JsonKey(name: 'red_zone') RedZone? redZone,@JsonKey(name: 'command_verdict') String commandVerdict, RoadmapAps? aps, Consensus? consensus, Explainability? explainability,@JsonKey(name: 'source_reports') Map<String, String>? sourceReports,@JsonKey(name: 'cascade_failure') Map<String, dynamic>? cascadeFailure
});


@override $RedZoneCopyWith<$Res>? get redZone;@override $RoadmapApsCopyWith<$Res>? get aps;@override $ConsensusCopyWith<$Res>? get consensus;@override $ExplainabilityCopyWith<$Res>? get explainability;

}
/// @nodoc
class __$PriorityRoadmapCopyWithImpl<$Res>
    implements _$PriorityRoadmapCopyWith<$Res> {
  __$PriorityRoadmapCopyWithImpl(this._self, this._then);

  final _PriorityRoadmap _self;
  final $Res Function(_PriorityRoadmap) _then;

/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? agent = null,Object? phase = null,Object? status = null,Object? redZone = freezed,Object? commandVerdict = null,Object? aps = freezed,Object? consensus = freezed,Object? explainability = freezed,Object? sourceReports = freezed,Object? cascadeFailure = freezed,}) {
  return _then(_PriorityRoadmap(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,redZone: freezed == redZone ? _self.redZone : redZone // ignore: cast_nullable_to_non_nullable
as RedZone?,commandVerdict: null == commandVerdict ? _self.commandVerdict : commandVerdict // ignore: cast_nullable_to_non_nullable
as String,aps: freezed == aps ? _self.aps : aps // ignore: cast_nullable_to_non_nullable
as RoadmapAps?,consensus: freezed == consensus ? _self.consensus : consensus // ignore: cast_nullable_to_non_nullable
as Consensus?,explainability: freezed == explainability ? _self.explainability : explainability // ignore: cast_nullable_to_non_nullable
as Explainability?,sourceReports: freezed == sourceReports ? _self._sourceReports : sourceReports // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,cascadeFailure: freezed == cascadeFailure ? _self._cascadeFailure : cascadeFailure // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RedZoneCopyWith<$Res>? get redZone {
    if (_self.redZone == null) {
    return null;
  }

  return $RedZoneCopyWith<$Res>(_self.redZone!, (value) {
    return _then(_self.copyWith(redZone: value));
  });
}/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapApsCopyWith<$Res>? get aps {
    if (_self.aps == null) {
    return null;
  }

  return $RoadmapApsCopyWith<$Res>(_self.aps!, (value) {
    return _then(_self.copyWith(aps: value));
  });
}/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsensusCopyWith<$Res>? get consensus {
    if (_self.consensus == null) {
    return null;
  }

  return $ConsensusCopyWith<$Res>(_self.consensus!, (value) {
    return _then(_self.copyWith(consensus: value));
  });
}/// Create a copy of PriorityRoadmap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExplainabilityCopyWith<$Res>? get explainability {
    if (_self.explainability == null) {
    return null;
  }

  return $ExplainabilityCopyWith<$Res>(_self.explainability!, (value) {
    return _then(_self.copyWith(explainability: value));
  });
}
}


/// @nodoc
mixin _$RedZone {

 String get location;@JsonKey(name: 'vibe_score') double? get vibeScore;@JsonKey(name: 'friction_score') double? get frictionScore; String get priority;
/// Create a copy of RedZone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RedZoneCopyWith<RedZone> get copyWith => _$RedZoneCopyWithImpl<RedZone>(this as RedZone, _$identity);

  /// Serializes this RedZone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RedZone&&(identical(other.location, location) || other.location == location)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.priority, priority) || other.priority == priority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,vibeScore,frictionScore,priority);

@override
String toString() {
  return 'RedZone(location: $location, vibeScore: $vibeScore, frictionScore: $frictionScore, priority: $priority)';
}


}

/// @nodoc
abstract mixin class $RedZoneCopyWith<$Res>  {
  factory $RedZoneCopyWith(RedZone value, $Res Function(RedZone) _then) = _$RedZoneCopyWithImpl;
@useResult
$Res call({
 String location,@JsonKey(name: 'vibe_score') double? vibeScore,@JsonKey(name: 'friction_score') double? frictionScore, String priority
});




}
/// @nodoc
class _$RedZoneCopyWithImpl<$Res>
    implements $RedZoneCopyWith<$Res> {
  _$RedZoneCopyWithImpl(this._self, this._then);

  final RedZone _self;
  final $Res Function(RedZone) _then;

/// Create a copy of RedZone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = null,Object? vibeScore = freezed,Object? frictionScore = freezed,Object? priority = null,}) {
  return _then(_self.copyWith(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,vibeScore: freezed == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double?,frictionScore: freezed == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RedZone].
extension RedZonePatterns on RedZone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RedZone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RedZone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RedZone value)  $default,){
final _that = this;
switch (_that) {
case _RedZone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RedZone value)?  $default,){
final _that = this;
switch (_that) {
case _RedZone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String location, @JsonKey(name: 'vibe_score')  double? vibeScore, @JsonKey(name: 'friction_score')  double? frictionScore,  String priority)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RedZone() when $default != null:
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.priority);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String location, @JsonKey(name: 'vibe_score')  double? vibeScore, @JsonKey(name: 'friction_score')  double? frictionScore,  String priority)  $default,) {final _that = this;
switch (_that) {
case _RedZone():
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.priority);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String location, @JsonKey(name: 'vibe_score')  double? vibeScore, @JsonKey(name: 'friction_score')  double? frictionScore,  String priority)?  $default,) {final _that = this;
switch (_that) {
case _RedZone() when $default != null:
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.priority);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RedZone implements RedZone {
  const _RedZone({required this.location, @JsonKey(name: 'vibe_score') this.vibeScore, @JsonKey(name: 'friction_score') this.frictionScore, required this.priority});
  factory _RedZone.fromJson(Map<String, dynamic> json) => _$RedZoneFromJson(json);

@override final  String location;
@override@JsonKey(name: 'vibe_score') final  double? vibeScore;
@override@JsonKey(name: 'friction_score') final  double? frictionScore;
@override final  String priority;

/// Create a copy of RedZone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RedZoneCopyWith<_RedZone> get copyWith => __$RedZoneCopyWithImpl<_RedZone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RedZoneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RedZone&&(identical(other.location, location) || other.location == location)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.priority, priority) || other.priority == priority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,vibeScore,frictionScore,priority);

@override
String toString() {
  return 'RedZone(location: $location, vibeScore: $vibeScore, frictionScore: $frictionScore, priority: $priority)';
}


}

/// @nodoc
abstract mixin class _$RedZoneCopyWith<$Res> implements $RedZoneCopyWith<$Res> {
  factory _$RedZoneCopyWith(_RedZone value, $Res Function(_RedZone) _then) = __$RedZoneCopyWithImpl;
@override @useResult
$Res call({
 String location,@JsonKey(name: 'vibe_score') double? vibeScore,@JsonKey(name: 'friction_score') double? frictionScore, String priority
});




}
/// @nodoc
class __$RedZoneCopyWithImpl<$Res>
    implements _$RedZoneCopyWith<$Res> {
  __$RedZoneCopyWithImpl(this._self, this._then);

  final _RedZone _self;
  final $Res Function(_RedZone) _then;

/// Create a copy of RedZone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = null,Object? vibeScore = freezed,Object? frictionScore = freezed,Object? priority = null,}) {
  return _then(_RedZone(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,vibeScore: freezed == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double?,frictionScore: freezed == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RoadmapAps {

@JsonKey(name: 'friction_vibe_ratio') double? get frictionVibeRatio;@JsonKey(name: 'temporal_weight_applied') bool? get temporalWeightApplied;@JsonKey(name: 'temporal_weight_recent_multiplier') double? get temporalWeightRecentMultiplier;@JsonKey(name: 'safety_calls_unweighted') int? get safetyCallsUnweighted;@JsonKey(name: 'safety_calls_weighted') int? get safetyCallsWeighted;
/// Create a copy of RoadmapAps
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadmapApsCopyWith<RoadmapAps> get copyWith => _$RoadmapApsCopyWithImpl<RoadmapAps>(this as RoadmapAps, _$identity);

  /// Serializes this RoadmapAps to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadmapAps&&(identical(other.frictionVibeRatio, frictionVibeRatio) || other.frictionVibeRatio == frictionVibeRatio)&&(identical(other.temporalWeightApplied, temporalWeightApplied) || other.temporalWeightApplied == temporalWeightApplied)&&(identical(other.temporalWeightRecentMultiplier, temporalWeightRecentMultiplier) || other.temporalWeightRecentMultiplier == temporalWeightRecentMultiplier)&&(identical(other.safetyCallsUnweighted, safetyCallsUnweighted) || other.safetyCallsUnweighted == safetyCallsUnweighted)&&(identical(other.safetyCallsWeighted, safetyCallsWeighted) || other.safetyCallsWeighted == safetyCallsWeighted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frictionVibeRatio,temporalWeightApplied,temporalWeightRecentMultiplier,safetyCallsUnweighted,safetyCallsWeighted);

@override
String toString() {
  return 'RoadmapAps(frictionVibeRatio: $frictionVibeRatio, temporalWeightApplied: $temporalWeightApplied, temporalWeightRecentMultiplier: $temporalWeightRecentMultiplier, safetyCallsUnweighted: $safetyCallsUnweighted, safetyCallsWeighted: $safetyCallsWeighted)';
}


}

/// @nodoc
abstract mixin class $RoadmapApsCopyWith<$Res>  {
  factory $RoadmapApsCopyWith(RoadmapAps value, $Res Function(RoadmapAps) _then) = _$RoadmapApsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'friction_vibe_ratio') double? frictionVibeRatio,@JsonKey(name: 'temporal_weight_applied') bool? temporalWeightApplied,@JsonKey(name: 'temporal_weight_recent_multiplier') double? temporalWeightRecentMultiplier,@JsonKey(name: 'safety_calls_unweighted') int? safetyCallsUnweighted,@JsonKey(name: 'safety_calls_weighted') int? safetyCallsWeighted
});




}
/// @nodoc
class _$RoadmapApsCopyWithImpl<$Res>
    implements $RoadmapApsCopyWith<$Res> {
  _$RoadmapApsCopyWithImpl(this._self, this._then);

  final RoadmapAps _self;
  final $Res Function(RoadmapAps) _then;

/// Create a copy of RoadmapAps
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frictionVibeRatio = freezed,Object? temporalWeightApplied = freezed,Object? temporalWeightRecentMultiplier = freezed,Object? safetyCallsUnweighted = freezed,Object? safetyCallsWeighted = freezed,}) {
  return _then(_self.copyWith(
frictionVibeRatio: freezed == frictionVibeRatio ? _self.frictionVibeRatio : frictionVibeRatio // ignore: cast_nullable_to_non_nullable
as double?,temporalWeightApplied: freezed == temporalWeightApplied ? _self.temporalWeightApplied : temporalWeightApplied // ignore: cast_nullable_to_non_nullable
as bool?,temporalWeightRecentMultiplier: freezed == temporalWeightRecentMultiplier ? _self.temporalWeightRecentMultiplier : temporalWeightRecentMultiplier // ignore: cast_nullable_to_non_nullable
as double?,safetyCallsUnweighted: freezed == safetyCallsUnweighted ? _self.safetyCallsUnweighted : safetyCallsUnweighted // ignore: cast_nullable_to_non_nullable
as int?,safetyCallsWeighted: freezed == safetyCallsWeighted ? _self.safetyCallsWeighted : safetyCallsWeighted // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoadmapAps].
extension RoadmapApsPatterns on RoadmapAps {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadmapAps value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadmapAps() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadmapAps value)  $default,){
final _that = this;
switch (_that) {
case _RoadmapAps():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadmapAps value)?  $default,){
final _that = this;
switch (_that) {
case _RoadmapAps() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'friction_vibe_ratio')  double? frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied')  bool? temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier')  double? temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted')  int? safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted')  int? safetyCallsWeighted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadmapAps() when $default != null:
return $default(_that.frictionVibeRatio,_that.temporalWeightApplied,_that.temporalWeightRecentMultiplier,_that.safetyCallsUnweighted,_that.safetyCallsWeighted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'friction_vibe_ratio')  double? frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied')  bool? temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier')  double? temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted')  int? safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted')  int? safetyCallsWeighted)  $default,) {final _that = this;
switch (_that) {
case _RoadmapAps():
return $default(_that.frictionVibeRatio,_that.temporalWeightApplied,_that.temporalWeightRecentMultiplier,_that.safetyCallsUnweighted,_that.safetyCallsWeighted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'friction_vibe_ratio')  double? frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied')  bool? temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier')  double? temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted')  int? safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted')  int? safetyCallsWeighted)?  $default,) {final _that = this;
switch (_that) {
case _RoadmapAps() when $default != null:
return $default(_that.frictionVibeRatio,_that.temporalWeightApplied,_that.temporalWeightRecentMultiplier,_that.safetyCallsUnweighted,_that.safetyCallsWeighted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadmapAps implements RoadmapAps {
  const _RoadmapAps({@JsonKey(name: 'friction_vibe_ratio') this.frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied') this.temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier') this.temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted') this.safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted') this.safetyCallsWeighted});
  factory _RoadmapAps.fromJson(Map<String, dynamic> json) => _$RoadmapApsFromJson(json);

@override@JsonKey(name: 'friction_vibe_ratio') final  double? frictionVibeRatio;
@override@JsonKey(name: 'temporal_weight_applied') final  bool? temporalWeightApplied;
@override@JsonKey(name: 'temporal_weight_recent_multiplier') final  double? temporalWeightRecentMultiplier;
@override@JsonKey(name: 'safety_calls_unweighted') final  int? safetyCallsUnweighted;
@override@JsonKey(name: 'safety_calls_weighted') final  int? safetyCallsWeighted;

/// Create a copy of RoadmapAps
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadmapApsCopyWith<_RoadmapAps> get copyWith => __$RoadmapApsCopyWithImpl<_RoadmapAps>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadmapApsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadmapAps&&(identical(other.frictionVibeRatio, frictionVibeRatio) || other.frictionVibeRatio == frictionVibeRatio)&&(identical(other.temporalWeightApplied, temporalWeightApplied) || other.temporalWeightApplied == temporalWeightApplied)&&(identical(other.temporalWeightRecentMultiplier, temporalWeightRecentMultiplier) || other.temporalWeightRecentMultiplier == temporalWeightRecentMultiplier)&&(identical(other.safetyCallsUnweighted, safetyCallsUnweighted) || other.safetyCallsUnweighted == safetyCallsUnweighted)&&(identical(other.safetyCallsWeighted, safetyCallsWeighted) || other.safetyCallsWeighted == safetyCallsWeighted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frictionVibeRatio,temporalWeightApplied,temporalWeightRecentMultiplier,safetyCallsUnweighted,safetyCallsWeighted);

@override
String toString() {
  return 'RoadmapAps(frictionVibeRatio: $frictionVibeRatio, temporalWeightApplied: $temporalWeightApplied, temporalWeightRecentMultiplier: $temporalWeightRecentMultiplier, safetyCallsUnweighted: $safetyCallsUnweighted, safetyCallsWeighted: $safetyCallsWeighted)';
}


}

/// @nodoc
abstract mixin class _$RoadmapApsCopyWith<$Res> implements $RoadmapApsCopyWith<$Res> {
  factory _$RoadmapApsCopyWith(_RoadmapAps value, $Res Function(_RoadmapAps) _then) = __$RoadmapApsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'friction_vibe_ratio') double? frictionVibeRatio,@JsonKey(name: 'temporal_weight_applied') bool? temporalWeightApplied,@JsonKey(name: 'temporal_weight_recent_multiplier') double? temporalWeightRecentMultiplier,@JsonKey(name: 'safety_calls_unweighted') int? safetyCallsUnweighted,@JsonKey(name: 'safety_calls_weighted') int? safetyCallsWeighted
});




}
/// @nodoc
class __$RoadmapApsCopyWithImpl<$Res>
    implements _$RoadmapApsCopyWith<$Res> {
  __$RoadmapApsCopyWithImpl(this._self, this._then);

  final _RoadmapAps _self;
  final $Res Function(_RoadmapAps) _then;

/// Create a copy of RoadmapAps
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frictionVibeRatio = freezed,Object? temporalWeightApplied = freezed,Object? temporalWeightRecentMultiplier = freezed,Object? safetyCallsUnweighted = freezed,Object? safetyCallsWeighted = freezed,}) {
  return _then(_RoadmapAps(
frictionVibeRatio: freezed == frictionVibeRatio ? _self.frictionVibeRatio : frictionVibeRatio // ignore: cast_nullable_to_non_nullable
as double?,temporalWeightApplied: freezed == temporalWeightApplied ? _self.temporalWeightApplied : temporalWeightApplied // ignore: cast_nullable_to_non_nullable
as bool?,temporalWeightRecentMultiplier: freezed == temporalWeightRecentMultiplier ? _self.temporalWeightRecentMultiplier : temporalWeightRecentMultiplier // ignore: cast_nullable_to_non_nullable
as double?,safetyCallsUnweighted: freezed == safetyCallsUnweighted ? _self.safetyCallsUnweighted : safetyCallsUnweighted // ignore: cast_nullable_to_non_nullable
as int?,safetyCallsWeighted: freezed == safetyCallsWeighted ? _self.safetyCallsWeighted : safetyCallsWeighted // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Consensus {

 Map<String, bool>? get votes;@JsonKey(name: 'resident_urgent') bool? get residentUrgent;@JsonKey(name: 'municipal_urgent') bool? get municipalUrgent;@JsonKey(name: 'economy_urgent') bool? get economyUrgent;@JsonKey(name: 'urgent_count') int? get urgentCount;@JsonKey(name: 'promoted_to_priority_alpha') bool? get promotedToPriorityAlpha;
/// Create a copy of Consensus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsensusCopyWith<Consensus> get copyWith => _$ConsensusCopyWithImpl<Consensus>(this as Consensus, _$identity);

  /// Serializes this Consensus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Consensus&&const DeepCollectionEquality().equals(other.votes, votes)&&(identical(other.residentUrgent, residentUrgent) || other.residentUrgent == residentUrgent)&&(identical(other.municipalUrgent, municipalUrgent) || other.municipalUrgent == municipalUrgent)&&(identical(other.economyUrgent, economyUrgent) || other.economyUrgent == economyUrgent)&&(identical(other.urgentCount, urgentCount) || other.urgentCount == urgentCount)&&(identical(other.promotedToPriorityAlpha, promotedToPriorityAlpha) || other.promotedToPriorityAlpha == promotedToPriorityAlpha));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(votes),residentUrgent,municipalUrgent,economyUrgent,urgentCount,promotedToPriorityAlpha);

@override
String toString() {
  return 'Consensus(votes: $votes, residentUrgent: $residentUrgent, municipalUrgent: $municipalUrgent, economyUrgent: $economyUrgent, urgentCount: $urgentCount, promotedToPriorityAlpha: $promotedToPriorityAlpha)';
}


}

/// @nodoc
abstract mixin class $ConsensusCopyWith<$Res>  {
  factory $ConsensusCopyWith(Consensus value, $Res Function(Consensus) _then) = _$ConsensusCopyWithImpl;
@useResult
$Res call({
 Map<String, bool>? votes,@JsonKey(name: 'resident_urgent') bool? residentUrgent,@JsonKey(name: 'municipal_urgent') bool? municipalUrgent,@JsonKey(name: 'economy_urgent') bool? economyUrgent,@JsonKey(name: 'urgent_count') int? urgentCount,@JsonKey(name: 'promoted_to_priority_alpha') bool? promotedToPriorityAlpha
});




}
/// @nodoc
class _$ConsensusCopyWithImpl<$Res>
    implements $ConsensusCopyWith<$Res> {
  _$ConsensusCopyWithImpl(this._self, this._then);

  final Consensus _self;
  final $Res Function(Consensus) _then;

/// Create a copy of Consensus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? votes = freezed,Object? residentUrgent = freezed,Object? municipalUrgent = freezed,Object? economyUrgent = freezed,Object? urgentCount = freezed,Object? promotedToPriorityAlpha = freezed,}) {
  return _then(_self.copyWith(
votes: freezed == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,residentUrgent: freezed == residentUrgent ? _self.residentUrgent : residentUrgent // ignore: cast_nullable_to_non_nullable
as bool?,municipalUrgent: freezed == municipalUrgent ? _self.municipalUrgent : municipalUrgent // ignore: cast_nullable_to_non_nullable
as bool?,economyUrgent: freezed == economyUrgent ? _self.economyUrgent : economyUrgent // ignore: cast_nullable_to_non_nullable
as bool?,urgentCount: freezed == urgentCount ? _self.urgentCount : urgentCount // ignore: cast_nullable_to_non_nullable
as int?,promotedToPriorityAlpha: freezed == promotedToPriorityAlpha ? _self.promotedToPriorityAlpha : promotedToPriorityAlpha // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Consensus].
extension ConsensusPatterns on Consensus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Consensus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Consensus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Consensus value)  $default,){
final _that = this;
switch (_that) {
case _Consensus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Consensus value)?  $default,){
final _that = this;
switch (_that) {
case _Consensus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, bool>? votes, @JsonKey(name: 'resident_urgent')  bool? residentUrgent, @JsonKey(name: 'municipal_urgent')  bool? municipalUrgent, @JsonKey(name: 'economy_urgent')  bool? economyUrgent, @JsonKey(name: 'urgent_count')  int? urgentCount, @JsonKey(name: 'promoted_to_priority_alpha')  bool? promotedToPriorityAlpha)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Consensus() when $default != null:
return $default(_that.votes,_that.residentUrgent,_that.municipalUrgent,_that.economyUrgent,_that.urgentCount,_that.promotedToPriorityAlpha);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, bool>? votes, @JsonKey(name: 'resident_urgent')  bool? residentUrgent, @JsonKey(name: 'municipal_urgent')  bool? municipalUrgent, @JsonKey(name: 'economy_urgent')  bool? economyUrgent, @JsonKey(name: 'urgent_count')  int? urgentCount, @JsonKey(name: 'promoted_to_priority_alpha')  bool? promotedToPriorityAlpha)  $default,) {final _that = this;
switch (_that) {
case _Consensus():
return $default(_that.votes,_that.residentUrgent,_that.municipalUrgent,_that.economyUrgent,_that.urgentCount,_that.promotedToPriorityAlpha);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, bool>? votes, @JsonKey(name: 'resident_urgent')  bool? residentUrgent, @JsonKey(name: 'municipal_urgent')  bool? municipalUrgent, @JsonKey(name: 'economy_urgent')  bool? economyUrgent, @JsonKey(name: 'urgent_count')  int? urgentCount, @JsonKey(name: 'promoted_to_priority_alpha')  bool? promotedToPriorityAlpha)?  $default,) {final _that = this;
switch (_that) {
case _Consensus() when $default != null:
return $default(_that.votes,_that.residentUrgent,_that.municipalUrgent,_that.economyUrgent,_that.urgentCount,_that.promotedToPriorityAlpha);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Consensus implements Consensus {
  const _Consensus({final  Map<String, bool>? votes, @JsonKey(name: 'resident_urgent') this.residentUrgent, @JsonKey(name: 'municipal_urgent') this.municipalUrgent, @JsonKey(name: 'economy_urgent') this.economyUrgent, @JsonKey(name: 'urgent_count') this.urgentCount, @JsonKey(name: 'promoted_to_priority_alpha') this.promotedToPriorityAlpha}): _votes = votes;
  factory _Consensus.fromJson(Map<String, dynamic> json) => _$ConsensusFromJson(json);

 final  Map<String, bool>? _votes;
@override Map<String, bool>? get votes {
  final value = _votes;
  if (value == null) return null;
  if (_votes is EqualUnmodifiableMapView) return _votes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'resident_urgent') final  bool? residentUrgent;
@override@JsonKey(name: 'municipal_urgent') final  bool? municipalUrgent;
@override@JsonKey(name: 'economy_urgent') final  bool? economyUrgent;
@override@JsonKey(name: 'urgent_count') final  int? urgentCount;
@override@JsonKey(name: 'promoted_to_priority_alpha') final  bool? promotedToPriorityAlpha;

/// Create a copy of Consensus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsensusCopyWith<_Consensus> get copyWith => __$ConsensusCopyWithImpl<_Consensus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsensusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Consensus&&const DeepCollectionEquality().equals(other._votes, _votes)&&(identical(other.residentUrgent, residentUrgent) || other.residentUrgent == residentUrgent)&&(identical(other.municipalUrgent, municipalUrgent) || other.municipalUrgent == municipalUrgent)&&(identical(other.economyUrgent, economyUrgent) || other.economyUrgent == economyUrgent)&&(identical(other.urgentCount, urgentCount) || other.urgentCount == urgentCount)&&(identical(other.promotedToPriorityAlpha, promotedToPriorityAlpha) || other.promotedToPriorityAlpha == promotedToPriorityAlpha));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_votes),residentUrgent,municipalUrgent,economyUrgent,urgentCount,promotedToPriorityAlpha);

@override
String toString() {
  return 'Consensus(votes: $votes, residentUrgent: $residentUrgent, municipalUrgent: $municipalUrgent, economyUrgent: $economyUrgent, urgentCount: $urgentCount, promotedToPriorityAlpha: $promotedToPriorityAlpha)';
}


}

/// @nodoc
abstract mixin class _$ConsensusCopyWith<$Res> implements $ConsensusCopyWith<$Res> {
  factory _$ConsensusCopyWith(_Consensus value, $Res Function(_Consensus) _then) = __$ConsensusCopyWithImpl;
@override @useResult
$Res call({
 Map<String, bool>? votes,@JsonKey(name: 'resident_urgent') bool? residentUrgent,@JsonKey(name: 'municipal_urgent') bool? municipalUrgent,@JsonKey(name: 'economy_urgent') bool? economyUrgent,@JsonKey(name: 'urgent_count') int? urgentCount,@JsonKey(name: 'promoted_to_priority_alpha') bool? promotedToPriorityAlpha
});




}
/// @nodoc
class __$ConsensusCopyWithImpl<$Res>
    implements _$ConsensusCopyWith<$Res> {
  __$ConsensusCopyWithImpl(this._self, this._then);

  final _Consensus _self;
  final $Res Function(_Consensus) _then;

/// Create a copy of Consensus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? votes = freezed,Object? residentUrgent = freezed,Object? municipalUrgent = freezed,Object? economyUrgent = freezed,Object? urgentCount = freezed,Object? promotedToPriorityAlpha = freezed,}) {
  return _then(_Consensus(
votes: freezed == votes ? _self._votes : votes // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,residentUrgent: freezed == residentUrgent ? _self.residentUrgent : residentUrgent // ignore: cast_nullable_to_non_nullable
as bool?,municipalUrgent: freezed == municipalUrgent ? _self.municipalUrgent : municipalUrgent // ignore: cast_nullable_to_non_nullable
as bool?,economyUrgent: freezed == economyUrgent ? _self.economyUrgent : economyUrgent // ignore: cast_nullable_to_non_nullable
as bool?,urgentCount: freezed == urgentCount ? _self.urgentCount : urgentCount // ignore: cast_nullable_to_non_nullable
as int?,promotedToPriorityAlpha: freezed == promotedToPriorityAlpha ? _self.promotedToPriorityAlpha : promotedToPriorityAlpha // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$Explainability {

@JsonKey(name: 'log_trace') String? get logTrace;
/// Create a copy of Explainability
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplainabilityCopyWith<Explainability> get copyWith => _$ExplainabilityCopyWithImpl<Explainability>(this as Explainability, _$identity);

  /// Serializes this Explainability to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Explainability&&(identical(other.logTrace, logTrace) || other.logTrace == logTrace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,logTrace);

@override
String toString() {
  return 'Explainability(logTrace: $logTrace)';
}


}

/// @nodoc
abstract mixin class $ExplainabilityCopyWith<$Res>  {
  factory $ExplainabilityCopyWith(Explainability value, $Res Function(Explainability) _then) = _$ExplainabilityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'log_trace') String? logTrace
});




}
/// @nodoc
class _$ExplainabilityCopyWithImpl<$Res>
    implements $ExplainabilityCopyWith<$Res> {
  _$ExplainabilityCopyWithImpl(this._self, this._then);

  final Explainability _self;
  final $Res Function(Explainability) _then;

/// Create a copy of Explainability
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logTrace = freezed,}) {
  return _then(_self.copyWith(
logTrace: freezed == logTrace ? _self.logTrace : logTrace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Explainability].
extension ExplainabilityPatterns on Explainability {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Explainability value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Explainability() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Explainability value)  $default,){
final _that = this;
switch (_that) {
case _Explainability():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Explainability value)?  $default,){
final _that = this;
switch (_that) {
case _Explainability() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'log_trace')  String? logTrace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Explainability() when $default != null:
return $default(_that.logTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'log_trace')  String? logTrace)  $default,) {final _that = this;
switch (_that) {
case _Explainability():
return $default(_that.logTrace);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'log_trace')  String? logTrace)?  $default,) {final _that = this;
switch (_that) {
case _Explainability() when $default != null:
return $default(_that.logTrace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Explainability implements Explainability {
  const _Explainability({@JsonKey(name: 'log_trace') this.logTrace});
  factory _Explainability.fromJson(Map<String, dynamic> json) => _$ExplainabilityFromJson(json);

@override@JsonKey(name: 'log_trace') final  String? logTrace;

/// Create a copy of Explainability
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplainabilityCopyWith<_Explainability> get copyWith => __$ExplainabilityCopyWithImpl<_Explainability>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExplainabilityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Explainability&&(identical(other.logTrace, logTrace) || other.logTrace == logTrace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,logTrace);

@override
String toString() {
  return 'Explainability(logTrace: $logTrace)';
}


}

/// @nodoc
abstract mixin class _$ExplainabilityCopyWith<$Res> implements $ExplainabilityCopyWith<$Res> {
  factory _$ExplainabilityCopyWith(_Explainability value, $Res Function(_Explainability) _then) = __$ExplainabilityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'log_trace') String? logTrace
});




}
/// @nodoc
class __$ExplainabilityCopyWithImpl<$Res>
    implements _$ExplainabilityCopyWith<$Res> {
  __$ExplainabilityCopyWithImpl(this._self, this._then);

  final _Explainability _self;
  final $Res Function(_Explainability) _then;

/// Create a copy of Explainability
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logTrace = freezed,}) {
  return _then(_Explainability(
logTrace: freezed == logTrace ? _self.logTrace : logTrace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
