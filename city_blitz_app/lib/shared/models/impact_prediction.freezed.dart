// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'impact_prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImpactPrediction {

 String get timestamp; String get agent; String get job;@JsonKey(name: 'target_location') String get targetLocation; String get priority;@JsonKey(name: 'friction_score') double get frictionScore;@JsonKey(name: 'vibe_score') double get vibeScore; ImpactAps get aps;@JsonKey(name: 'roi_assumptions') RoiAssumptions get roiAssumptions; ImpactBaseline get baseline; ImpactProjection get projection;
/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImpactPredictionCopyWith<ImpactPrediction> get copyWith => _$ImpactPredictionCopyWithImpl<ImpactPrediction>(this as ImpactPrediction, _$identity);

  /// Serializes this ImpactPrediction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImpactPrediction&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&(identical(other.job, job) || other.job == job)&&(identical(other.targetLocation, targetLocation) || other.targetLocation == targetLocation)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.aps, aps) || other.aps == aps)&&(identical(other.roiAssumptions, roiAssumptions) || other.roiAssumptions == roiAssumptions)&&(identical(other.baseline, baseline) || other.baseline == baseline)&&(identical(other.projection, projection) || other.projection == projection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,job,targetLocation,priority,frictionScore,vibeScore,aps,roiAssumptions,baseline,projection);

@override
String toString() {
  return 'ImpactPrediction(timestamp: $timestamp, agent: $agent, job: $job, targetLocation: $targetLocation, priority: $priority, frictionScore: $frictionScore, vibeScore: $vibeScore, aps: $aps, roiAssumptions: $roiAssumptions, baseline: $baseline, projection: $projection)';
}


}

/// @nodoc
abstract mixin class $ImpactPredictionCopyWith<$Res>  {
  factory $ImpactPredictionCopyWith(ImpactPrediction value, $Res Function(ImpactPrediction) _then) = _$ImpactPredictionCopyWithImpl;
@useResult
$Res call({
 String timestamp, String agent, String job,@JsonKey(name: 'target_location') String targetLocation, String priority,@JsonKey(name: 'friction_score') double frictionScore,@JsonKey(name: 'vibe_score') double vibeScore, ImpactAps aps,@JsonKey(name: 'roi_assumptions') RoiAssumptions roiAssumptions, ImpactBaseline baseline, ImpactProjection projection
});


$ImpactApsCopyWith<$Res> get aps;$RoiAssumptionsCopyWith<$Res> get roiAssumptions;$ImpactBaselineCopyWith<$Res> get baseline;$ImpactProjectionCopyWith<$Res> get projection;

}
/// @nodoc
class _$ImpactPredictionCopyWithImpl<$Res>
    implements $ImpactPredictionCopyWith<$Res> {
  _$ImpactPredictionCopyWithImpl(this._self, this._then);

  final ImpactPrediction _self;
  final $Res Function(ImpactPrediction) _then;

/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? agent = null,Object? job = null,Object? targetLocation = null,Object? priority = null,Object? frictionScore = null,Object? vibeScore = null,Object? aps = null,Object? roiAssumptions = null,Object? baseline = null,Object? projection = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,targetLocation: null == targetLocation ? _self.targetLocation : targetLocation // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,vibeScore: null == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double,aps: null == aps ? _self.aps : aps // ignore: cast_nullable_to_non_nullable
as ImpactAps,roiAssumptions: null == roiAssumptions ? _self.roiAssumptions : roiAssumptions // ignore: cast_nullable_to_non_nullable
as RoiAssumptions,baseline: null == baseline ? _self.baseline : baseline // ignore: cast_nullable_to_non_nullable
as ImpactBaseline,projection: null == projection ? _self.projection : projection // ignore: cast_nullable_to_non_nullable
as ImpactProjection,
  ));
}
/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImpactApsCopyWith<$Res> get aps {
  
  return $ImpactApsCopyWith<$Res>(_self.aps, (value) {
    return _then(_self.copyWith(aps: value));
  });
}/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoiAssumptionsCopyWith<$Res> get roiAssumptions {
  
  return $RoiAssumptionsCopyWith<$Res>(_self.roiAssumptions, (value) {
    return _then(_self.copyWith(roiAssumptions: value));
  });
}/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImpactBaselineCopyWith<$Res> get baseline {
  
  return $ImpactBaselineCopyWith<$Res>(_self.baseline, (value) {
    return _then(_self.copyWith(baseline: value));
  });
}/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImpactProjectionCopyWith<$Res> get projection {
  
  return $ImpactProjectionCopyWith<$Res>(_self.projection, (value) {
    return _then(_self.copyWith(projection: value));
  });
}
}


/// Adds pattern-matching-related methods to [ImpactPrediction].
extension ImpactPredictionPatterns on ImpactPrediction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImpactPrediction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImpactPrediction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImpactPrediction value)  $default,){
final _that = this;
switch (_that) {
case _ImpactPrediction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImpactPrediction value)?  $default,){
final _that = this;
switch (_that) {
case _ImpactPrediction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String timestamp,  String agent,  String job, @JsonKey(name: 'target_location')  String targetLocation,  String priority, @JsonKey(name: 'friction_score')  double frictionScore, @JsonKey(name: 'vibe_score')  double vibeScore,  ImpactAps aps, @JsonKey(name: 'roi_assumptions')  RoiAssumptions roiAssumptions,  ImpactBaseline baseline,  ImpactProjection projection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImpactPrediction() when $default != null:
return $default(_that.timestamp,_that.agent,_that.job,_that.targetLocation,_that.priority,_that.frictionScore,_that.vibeScore,_that.aps,_that.roiAssumptions,_that.baseline,_that.projection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String timestamp,  String agent,  String job, @JsonKey(name: 'target_location')  String targetLocation,  String priority, @JsonKey(name: 'friction_score')  double frictionScore, @JsonKey(name: 'vibe_score')  double vibeScore,  ImpactAps aps, @JsonKey(name: 'roi_assumptions')  RoiAssumptions roiAssumptions,  ImpactBaseline baseline,  ImpactProjection projection)  $default,) {final _that = this;
switch (_that) {
case _ImpactPrediction():
return $default(_that.timestamp,_that.agent,_that.job,_that.targetLocation,_that.priority,_that.frictionScore,_that.vibeScore,_that.aps,_that.roiAssumptions,_that.baseline,_that.projection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String timestamp,  String agent,  String job, @JsonKey(name: 'target_location')  String targetLocation,  String priority, @JsonKey(name: 'friction_score')  double frictionScore, @JsonKey(name: 'vibe_score')  double vibeScore,  ImpactAps aps, @JsonKey(name: 'roi_assumptions')  RoiAssumptions roiAssumptions,  ImpactBaseline baseline,  ImpactProjection projection)?  $default,) {final _that = this;
switch (_that) {
case _ImpactPrediction() when $default != null:
return $default(_that.timestamp,_that.agent,_that.job,_that.targetLocation,_that.priority,_that.frictionScore,_that.vibeScore,_that.aps,_that.roiAssumptions,_that.baseline,_that.projection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImpactPrediction implements ImpactPrediction {
  const _ImpactPrediction({required this.timestamp, required this.agent, required this.job, @JsonKey(name: 'target_location') required this.targetLocation, required this.priority, @JsonKey(name: 'friction_score') required this.frictionScore, @JsonKey(name: 'vibe_score') required this.vibeScore, required this.aps, @JsonKey(name: 'roi_assumptions') required this.roiAssumptions, required this.baseline, required this.projection});
  factory _ImpactPrediction.fromJson(Map<String, dynamic> json) => _$ImpactPredictionFromJson(json);

@override final  String timestamp;
@override final  String agent;
@override final  String job;
@override@JsonKey(name: 'target_location') final  String targetLocation;
@override final  String priority;
@override@JsonKey(name: 'friction_score') final  double frictionScore;
@override@JsonKey(name: 'vibe_score') final  double vibeScore;
@override final  ImpactAps aps;
@override@JsonKey(name: 'roi_assumptions') final  RoiAssumptions roiAssumptions;
@override final  ImpactBaseline baseline;
@override final  ImpactProjection projection;

/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImpactPredictionCopyWith<_ImpactPrediction> get copyWith => __$ImpactPredictionCopyWithImpl<_ImpactPrediction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImpactPredictionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImpactPrediction&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.agent, agent) || other.agent == agent)&&(identical(other.job, job) || other.job == job)&&(identical(other.targetLocation, targetLocation) || other.targetLocation == targetLocation)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.aps, aps) || other.aps == aps)&&(identical(other.roiAssumptions, roiAssumptions) || other.roiAssumptions == roiAssumptions)&&(identical(other.baseline, baseline) || other.baseline == baseline)&&(identical(other.projection, projection) || other.projection == projection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,agent,job,targetLocation,priority,frictionScore,vibeScore,aps,roiAssumptions,baseline,projection);

@override
String toString() {
  return 'ImpactPrediction(timestamp: $timestamp, agent: $agent, job: $job, targetLocation: $targetLocation, priority: $priority, frictionScore: $frictionScore, vibeScore: $vibeScore, aps: $aps, roiAssumptions: $roiAssumptions, baseline: $baseline, projection: $projection)';
}


}

/// @nodoc
abstract mixin class _$ImpactPredictionCopyWith<$Res> implements $ImpactPredictionCopyWith<$Res> {
  factory _$ImpactPredictionCopyWith(_ImpactPrediction value, $Res Function(_ImpactPrediction) _then) = __$ImpactPredictionCopyWithImpl;
@override @useResult
$Res call({
 String timestamp, String agent, String job,@JsonKey(name: 'target_location') String targetLocation, String priority,@JsonKey(name: 'friction_score') double frictionScore,@JsonKey(name: 'vibe_score') double vibeScore, ImpactAps aps,@JsonKey(name: 'roi_assumptions') RoiAssumptions roiAssumptions, ImpactBaseline baseline, ImpactProjection projection
});


@override $ImpactApsCopyWith<$Res> get aps;@override $RoiAssumptionsCopyWith<$Res> get roiAssumptions;@override $ImpactBaselineCopyWith<$Res> get baseline;@override $ImpactProjectionCopyWith<$Res> get projection;

}
/// @nodoc
class __$ImpactPredictionCopyWithImpl<$Res>
    implements _$ImpactPredictionCopyWith<$Res> {
  __$ImpactPredictionCopyWithImpl(this._self, this._then);

  final _ImpactPrediction _self;
  final $Res Function(_ImpactPrediction) _then;

/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? agent = null,Object? job = null,Object? targetLocation = null,Object? priority = null,Object? frictionScore = null,Object? vibeScore = null,Object? aps = null,Object? roiAssumptions = null,Object? baseline = null,Object? projection = null,}) {
  return _then(_ImpactPrediction(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,agent: null == agent ? _self.agent : agent // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,targetLocation: null == targetLocation ? _self.targetLocation : targetLocation // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,vibeScore: null == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double,aps: null == aps ? _self.aps : aps // ignore: cast_nullable_to_non_nullable
as ImpactAps,roiAssumptions: null == roiAssumptions ? _self.roiAssumptions : roiAssumptions // ignore: cast_nullable_to_non_nullable
as RoiAssumptions,baseline: null == baseline ? _self.baseline : baseline // ignore: cast_nullable_to_non_nullable
as ImpactBaseline,projection: null == projection ? _self.projection : projection // ignore: cast_nullable_to_non_nullable
as ImpactProjection,
  ));
}

/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImpactApsCopyWith<$Res> get aps {
  
  return $ImpactApsCopyWith<$Res>(_self.aps, (value) {
    return _then(_self.copyWith(aps: value));
  });
}/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoiAssumptionsCopyWith<$Res> get roiAssumptions {
  
  return $RoiAssumptionsCopyWith<$Res>(_self.roiAssumptions, (value) {
    return _then(_self.copyWith(roiAssumptions: value));
  });
}/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImpactBaselineCopyWith<$Res> get baseline {
  
  return $ImpactBaselineCopyWith<$Res>(_self.baseline, (value) {
    return _then(_self.copyWith(baseline: value));
  });
}/// Create a copy of ImpactPrediction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImpactProjectionCopyWith<$Res> get projection {
  
  return $ImpactProjectionCopyWith<$Res>(_self.projection, (value) {
    return _then(_self.copyWith(projection: value));
  });
}
}


/// @nodoc
mixin _$ImpactAps {

@JsonKey(name: 'friction_vibe_ratio') double get frictionVibeRatio;@JsonKey(name: 'temporal_weight_applied') bool get temporalWeightApplied;@JsonKey(name: 'temporal_weight_recent_multiplier') double get temporalWeightRecentMultiplier;@JsonKey(name: 'safety_calls_unweighted') int get safetyCallsUnweighted;@JsonKey(name: 'safety_calls_weighted') int get safetyCallsWeighted;
/// Create a copy of ImpactAps
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImpactApsCopyWith<ImpactAps> get copyWith => _$ImpactApsCopyWithImpl<ImpactAps>(this as ImpactAps, _$identity);

  /// Serializes this ImpactAps to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImpactAps&&(identical(other.frictionVibeRatio, frictionVibeRatio) || other.frictionVibeRatio == frictionVibeRatio)&&(identical(other.temporalWeightApplied, temporalWeightApplied) || other.temporalWeightApplied == temporalWeightApplied)&&(identical(other.temporalWeightRecentMultiplier, temporalWeightRecentMultiplier) || other.temporalWeightRecentMultiplier == temporalWeightRecentMultiplier)&&(identical(other.safetyCallsUnweighted, safetyCallsUnweighted) || other.safetyCallsUnweighted == safetyCallsUnweighted)&&(identical(other.safetyCallsWeighted, safetyCallsWeighted) || other.safetyCallsWeighted == safetyCallsWeighted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frictionVibeRatio,temporalWeightApplied,temporalWeightRecentMultiplier,safetyCallsUnweighted,safetyCallsWeighted);

@override
String toString() {
  return 'ImpactAps(frictionVibeRatio: $frictionVibeRatio, temporalWeightApplied: $temporalWeightApplied, temporalWeightRecentMultiplier: $temporalWeightRecentMultiplier, safetyCallsUnweighted: $safetyCallsUnweighted, safetyCallsWeighted: $safetyCallsWeighted)';
}


}

/// @nodoc
abstract mixin class $ImpactApsCopyWith<$Res>  {
  factory $ImpactApsCopyWith(ImpactAps value, $Res Function(ImpactAps) _then) = _$ImpactApsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'friction_vibe_ratio') double frictionVibeRatio,@JsonKey(name: 'temporal_weight_applied') bool temporalWeightApplied,@JsonKey(name: 'temporal_weight_recent_multiplier') double temporalWeightRecentMultiplier,@JsonKey(name: 'safety_calls_unweighted') int safetyCallsUnweighted,@JsonKey(name: 'safety_calls_weighted') int safetyCallsWeighted
});




}
/// @nodoc
class _$ImpactApsCopyWithImpl<$Res>
    implements $ImpactApsCopyWith<$Res> {
  _$ImpactApsCopyWithImpl(this._self, this._then);

  final ImpactAps _self;
  final $Res Function(ImpactAps) _then;

/// Create a copy of ImpactAps
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frictionVibeRatio = null,Object? temporalWeightApplied = null,Object? temporalWeightRecentMultiplier = null,Object? safetyCallsUnweighted = null,Object? safetyCallsWeighted = null,}) {
  return _then(_self.copyWith(
frictionVibeRatio: null == frictionVibeRatio ? _self.frictionVibeRatio : frictionVibeRatio // ignore: cast_nullable_to_non_nullable
as double,temporalWeightApplied: null == temporalWeightApplied ? _self.temporalWeightApplied : temporalWeightApplied // ignore: cast_nullable_to_non_nullable
as bool,temporalWeightRecentMultiplier: null == temporalWeightRecentMultiplier ? _self.temporalWeightRecentMultiplier : temporalWeightRecentMultiplier // ignore: cast_nullable_to_non_nullable
as double,safetyCallsUnweighted: null == safetyCallsUnweighted ? _self.safetyCallsUnweighted : safetyCallsUnweighted // ignore: cast_nullable_to_non_nullable
as int,safetyCallsWeighted: null == safetyCallsWeighted ? _self.safetyCallsWeighted : safetyCallsWeighted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ImpactAps].
extension ImpactApsPatterns on ImpactAps {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImpactAps value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImpactAps() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImpactAps value)  $default,){
final _that = this;
switch (_that) {
case _ImpactAps():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImpactAps value)?  $default,){
final _that = this;
switch (_that) {
case _ImpactAps() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'friction_vibe_ratio')  double frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied')  bool temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier')  double temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted')  int safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted')  int safetyCallsWeighted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImpactAps() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'friction_vibe_ratio')  double frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied')  bool temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier')  double temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted')  int safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted')  int safetyCallsWeighted)  $default,) {final _that = this;
switch (_that) {
case _ImpactAps():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'friction_vibe_ratio')  double frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied')  bool temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier')  double temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted')  int safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted')  int safetyCallsWeighted)?  $default,) {final _that = this;
switch (_that) {
case _ImpactAps() when $default != null:
return $default(_that.frictionVibeRatio,_that.temporalWeightApplied,_that.temporalWeightRecentMultiplier,_that.safetyCallsUnweighted,_that.safetyCallsWeighted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImpactAps implements ImpactAps {
  const _ImpactAps({@JsonKey(name: 'friction_vibe_ratio') required this.frictionVibeRatio, @JsonKey(name: 'temporal_weight_applied') required this.temporalWeightApplied, @JsonKey(name: 'temporal_weight_recent_multiplier') required this.temporalWeightRecentMultiplier, @JsonKey(name: 'safety_calls_unweighted') required this.safetyCallsUnweighted, @JsonKey(name: 'safety_calls_weighted') required this.safetyCallsWeighted});
  factory _ImpactAps.fromJson(Map<String, dynamic> json) => _$ImpactApsFromJson(json);

@override@JsonKey(name: 'friction_vibe_ratio') final  double frictionVibeRatio;
@override@JsonKey(name: 'temporal_weight_applied') final  bool temporalWeightApplied;
@override@JsonKey(name: 'temporal_weight_recent_multiplier') final  double temporalWeightRecentMultiplier;
@override@JsonKey(name: 'safety_calls_unweighted') final  int safetyCallsUnweighted;
@override@JsonKey(name: 'safety_calls_weighted') final  int safetyCallsWeighted;

/// Create a copy of ImpactAps
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImpactApsCopyWith<_ImpactAps> get copyWith => __$ImpactApsCopyWithImpl<_ImpactAps>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImpactApsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImpactAps&&(identical(other.frictionVibeRatio, frictionVibeRatio) || other.frictionVibeRatio == frictionVibeRatio)&&(identical(other.temporalWeightApplied, temporalWeightApplied) || other.temporalWeightApplied == temporalWeightApplied)&&(identical(other.temporalWeightRecentMultiplier, temporalWeightRecentMultiplier) || other.temporalWeightRecentMultiplier == temporalWeightRecentMultiplier)&&(identical(other.safetyCallsUnweighted, safetyCallsUnweighted) || other.safetyCallsUnweighted == safetyCallsUnweighted)&&(identical(other.safetyCallsWeighted, safetyCallsWeighted) || other.safetyCallsWeighted == safetyCallsWeighted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frictionVibeRatio,temporalWeightApplied,temporalWeightRecentMultiplier,safetyCallsUnweighted,safetyCallsWeighted);

@override
String toString() {
  return 'ImpactAps(frictionVibeRatio: $frictionVibeRatio, temporalWeightApplied: $temporalWeightApplied, temporalWeightRecentMultiplier: $temporalWeightRecentMultiplier, safetyCallsUnweighted: $safetyCallsUnweighted, safetyCallsWeighted: $safetyCallsWeighted)';
}


}

/// @nodoc
abstract mixin class _$ImpactApsCopyWith<$Res> implements $ImpactApsCopyWith<$Res> {
  factory _$ImpactApsCopyWith(_ImpactAps value, $Res Function(_ImpactAps) _then) = __$ImpactApsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'friction_vibe_ratio') double frictionVibeRatio,@JsonKey(name: 'temporal_weight_applied') bool temporalWeightApplied,@JsonKey(name: 'temporal_weight_recent_multiplier') double temporalWeightRecentMultiplier,@JsonKey(name: 'safety_calls_unweighted') int safetyCallsUnweighted,@JsonKey(name: 'safety_calls_weighted') int safetyCallsWeighted
});




}
/// @nodoc
class __$ImpactApsCopyWithImpl<$Res>
    implements _$ImpactApsCopyWith<$Res> {
  __$ImpactApsCopyWithImpl(this._self, this._then);

  final _ImpactAps _self;
  final $Res Function(_ImpactAps) _then;

/// Create a copy of ImpactAps
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frictionVibeRatio = null,Object? temporalWeightApplied = null,Object? temporalWeightRecentMultiplier = null,Object? safetyCallsUnweighted = null,Object? safetyCallsWeighted = null,}) {
  return _then(_ImpactAps(
frictionVibeRatio: null == frictionVibeRatio ? _self.frictionVibeRatio : frictionVibeRatio // ignore: cast_nullable_to_non_nullable
as double,temporalWeightApplied: null == temporalWeightApplied ? _self.temporalWeightApplied : temporalWeightApplied // ignore: cast_nullable_to_non_nullable
as bool,temporalWeightRecentMultiplier: null == temporalWeightRecentMultiplier ? _self.temporalWeightRecentMultiplier : temporalWeightRecentMultiplier // ignore: cast_nullable_to_non_nullable
as double,safetyCallsUnweighted: null == safetyCallsUnweighted ? _self.safetyCallsUnweighted : safetyCallsUnweighted // ignore: cast_nullable_to_non_nullable
as int,safetyCallsWeighted: null == safetyCallsWeighted ? _self.safetyCallsWeighted : safetyCallsWeighted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RoiAssumptions {

@JsonKey(name: 'reduction_range') List<double> get reductionRange;@JsonKey(name: 'cost_per_call') double get costPerCall; String get theory;
/// Create a copy of RoiAssumptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoiAssumptionsCopyWith<RoiAssumptions> get copyWith => _$RoiAssumptionsCopyWithImpl<RoiAssumptions>(this as RoiAssumptions, _$identity);

  /// Serializes this RoiAssumptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoiAssumptions&&const DeepCollectionEquality().equals(other.reductionRange, reductionRange)&&(identical(other.costPerCall, costPerCall) || other.costPerCall == costPerCall)&&(identical(other.theory, theory) || other.theory == theory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reductionRange),costPerCall,theory);

@override
String toString() {
  return 'RoiAssumptions(reductionRange: $reductionRange, costPerCall: $costPerCall, theory: $theory)';
}


}

/// @nodoc
abstract mixin class $RoiAssumptionsCopyWith<$Res>  {
  factory $RoiAssumptionsCopyWith(RoiAssumptions value, $Res Function(RoiAssumptions) _then) = _$RoiAssumptionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'reduction_range') List<double> reductionRange,@JsonKey(name: 'cost_per_call') double costPerCall, String theory
});




}
/// @nodoc
class _$RoiAssumptionsCopyWithImpl<$Res>
    implements $RoiAssumptionsCopyWith<$Res> {
  _$RoiAssumptionsCopyWithImpl(this._self, this._then);

  final RoiAssumptions _self;
  final $Res Function(RoiAssumptions) _then;

/// Create a copy of RoiAssumptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reductionRange = null,Object? costPerCall = null,Object? theory = null,}) {
  return _then(_self.copyWith(
reductionRange: null == reductionRange ? _self.reductionRange : reductionRange // ignore: cast_nullable_to_non_nullable
as List<double>,costPerCall: null == costPerCall ? _self.costPerCall : costPerCall // ignore: cast_nullable_to_non_nullable
as double,theory: null == theory ? _self.theory : theory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoiAssumptions].
extension RoiAssumptionsPatterns on RoiAssumptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoiAssumptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoiAssumptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoiAssumptions value)  $default,){
final _that = this;
switch (_that) {
case _RoiAssumptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoiAssumptions value)?  $default,){
final _that = this;
switch (_that) {
case _RoiAssumptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'reduction_range')  List<double> reductionRange, @JsonKey(name: 'cost_per_call')  double costPerCall,  String theory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoiAssumptions() when $default != null:
return $default(_that.reductionRange,_that.costPerCall,_that.theory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'reduction_range')  List<double> reductionRange, @JsonKey(name: 'cost_per_call')  double costPerCall,  String theory)  $default,) {final _that = this;
switch (_that) {
case _RoiAssumptions():
return $default(_that.reductionRange,_that.costPerCall,_that.theory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'reduction_range')  List<double> reductionRange, @JsonKey(name: 'cost_per_call')  double costPerCall,  String theory)?  $default,) {final _that = this;
switch (_that) {
case _RoiAssumptions() when $default != null:
return $default(_that.reductionRange,_that.costPerCall,_that.theory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoiAssumptions implements RoiAssumptions {
  const _RoiAssumptions({@JsonKey(name: 'reduction_range') required final  List<double> reductionRange, @JsonKey(name: 'cost_per_call') required this.costPerCall, required this.theory}): _reductionRange = reductionRange;
  factory _RoiAssumptions.fromJson(Map<String, dynamic> json) => _$RoiAssumptionsFromJson(json);

 final  List<double> _reductionRange;
@override@JsonKey(name: 'reduction_range') List<double> get reductionRange {
  if (_reductionRange is EqualUnmodifiableListView) return _reductionRange;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reductionRange);
}

@override@JsonKey(name: 'cost_per_call') final  double costPerCall;
@override final  String theory;

/// Create a copy of RoiAssumptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoiAssumptionsCopyWith<_RoiAssumptions> get copyWith => __$RoiAssumptionsCopyWithImpl<_RoiAssumptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoiAssumptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoiAssumptions&&const DeepCollectionEquality().equals(other._reductionRange, _reductionRange)&&(identical(other.costPerCall, costPerCall) || other.costPerCall == costPerCall)&&(identical(other.theory, theory) || other.theory == theory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reductionRange),costPerCall,theory);

@override
String toString() {
  return 'RoiAssumptions(reductionRange: $reductionRange, costPerCall: $costPerCall, theory: $theory)';
}


}

/// @nodoc
abstract mixin class _$RoiAssumptionsCopyWith<$Res> implements $RoiAssumptionsCopyWith<$Res> {
  factory _$RoiAssumptionsCopyWith(_RoiAssumptions value, $Res Function(_RoiAssumptions) _then) = __$RoiAssumptionsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'reduction_range') List<double> reductionRange,@JsonKey(name: 'cost_per_call') double costPerCall, String theory
});




}
/// @nodoc
class __$RoiAssumptionsCopyWithImpl<$Res>
    implements _$RoiAssumptionsCopyWith<$Res> {
  __$RoiAssumptionsCopyWithImpl(this._self, this._then);

  final _RoiAssumptions _self;
  final $Res Function(_RoiAssumptions) _then;

/// Create a copy of RoiAssumptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reductionRange = null,Object? costPerCall = null,Object? theory = null,}) {
  return _then(_RoiAssumptions(
reductionRange: null == reductionRange ? _self._reductionRange : reductionRange // ignore: cast_nullable_to_non_nullable
as List<double>,costPerCall: null == costPerCall ? _self.costPerCall : costPerCall // ignore: cast_nullable_to_non_nullable
as double,theory: null == theory ? _self.theory : theory // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ImpactBaseline {

@JsonKey(name: 'total_911_calls') int get total911Calls;@JsonKey(name: 'zone_911_calls') int get zone911Calls;@JsonKey(name: 'safety_911_calls_in_zone') int get safety911CallsInZone;@JsonKey(name: 'zone_share_of_city_calls') double get zoneShareOfCityCalls;
/// Create a copy of ImpactBaseline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImpactBaselineCopyWith<ImpactBaseline> get copyWith => _$ImpactBaselineCopyWithImpl<ImpactBaseline>(this as ImpactBaseline, _$identity);

  /// Serializes this ImpactBaseline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImpactBaseline&&(identical(other.total911Calls, total911Calls) || other.total911Calls == total911Calls)&&(identical(other.zone911Calls, zone911Calls) || other.zone911Calls == zone911Calls)&&(identical(other.safety911CallsInZone, safety911CallsInZone) || other.safety911CallsInZone == safety911CallsInZone)&&(identical(other.zoneShareOfCityCalls, zoneShareOfCityCalls) || other.zoneShareOfCityCalls == zoneShareOfCityCalls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total911Calls,zone911Calls,safety911CallsInZone,zoneShareOfCityCalls);

@override
String toString() {
  return 'ImpactBaseline(total911Calls: $total911Calls, zone911Calls: $zone911Calls, safety911CallsInZone: $safety911CallsInZone, zoneShareOfCityCalls: $zoneShareOfCityCalls)';
}


}

/// @nodoc
abstract mixin class $ImpactBaselineCopyWith<$Res>  {
  factory $ImpactBaselineCopyWith(ImpactBaseline value, $Res Function(ImpactBaseline) _then) = _$ImpactBaselineCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_911_calls') int total911Calls,@JsonKey(name: 'zone_911_calls') int zone911Calls,@JsonKey(name: 'safety_911_calls_in_zone') int safety911CallsInZone,@JsonKey(name: 'zone_share_of_city_calls') double zoneShareOfCityCalls
});




}
/// @nodoc
class _$ImpactBaselineCopyWithImpl<$Res>
    implements $ImpactBaselineCopyWith<$Res> {
  _$ImpactBaselineCopyWithImpl(this._self, this._then);

  final ImpactBaseline _self;
  final $Res Function(ImpactBaseline) _then;

/// Create a copy of ImpactBaseline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total911Calls = null,Object? zone911Calls = null,Object? safety911CallsInZone = null,Object? zoneShareOfCityCalls = null,}) {
  return _then(_self.copyWith(
total911Calls: null == total911Calls ? _self.total911Calls : total911Calls // ignore: cast_nullable_to_non_nullable
as int,zone911Calls: null == zone911Calls ? _self.zone911Calls : zone911Calls // ignore: cast_nullable_to_non_nullable
as int,safety911CallsInZone: null == safety911CallsInZone ? _self.safety911CallsInZone : safety911CallsInZone // ignore: cast_nullable_to_non_nullable
as int,zoneShareOfCityCalls: null == zoneShareOfCityCalls ? _self.zoneShareOfCityCalls : zoneShareOfCityCalls // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ImpactBaseline].
extension ImpactBaselinePatterns on ImpactBaseline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImpactBaseline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImpactBaseline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImpactBaseline value)  $default,){
final _that = this;
switch (_that) {
case _ImpactBaseline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImpactBaseline value)?  $default,){
final _that = this;
switch (_that) {
case _ImpactBaseline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_911_calls')  int total911Calls, @JsonKey(name: 'zone_911_calls')  int zone911Calls, @JsonKey(name: 'safety_911_calls_in_zone')  int safety911CallsInZone, @JsonKey(name: 'zone_share_of_city_calls')  double zoneShareOfCityCalls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImpactBaseline() when $default != null:
return $default(_that.total911Calls,_that.zone911Calls,_that.safety911CallsInZone,_that.zoneShareOfCityCalls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_911_calls')  int total911Calls, @JsonKey(name: 'zone_911_calls')  int zone911Calls, @JsonKey(name: 'safety_911_calls_in_zone')  int safety911CallsInZone, @JsonKey(name: 'zone_share_of_city_calls')  double zoneShareOfCityCalls)  $default,) {final _that = this;
switch (_that) {
case _ImpactBaseline():
return $default(_that.total911Calls,_that.zone911Calls,_that.safety911CallsInZone,_that.zoneShareOfCityCalls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_911_calls')  int total911Calls, @JsonKey(name: 'zone_911_calls')  int zone911Calls, @JsonKey(name: 'safety_911_calls_in_zone')  int safety911CallsInZone, @JsonKey(name: 'zone_share_of_city_calls')  double zoneShareOfCityCalls)?  $default,) {final _that = this;
switch (_that) {
case _ImpactBaseline() when $default != null:
return $default(_that.total911Calls,_that.zone911Calls,_that.safety911CallsInZone,_that.zoneShareOfCityCalls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImpactBaseline implements ImpactBaseline {
  const _ImpactBaseline({@JsonKey(name: 'total_911_calls') required this.total911Calls, @JsonKey(name: 'zone_911_calls') required this.zone911Calls, @JsonKey(name: 'safety_911_calls_in_zone') required this.safety911CallsInZone, @JsonKey(name: 'zone_share_of_city_calls') required this.zoneShareOfCityCalls});
  factory _ImpactBaseline.fromJson(Map<String, dynamic> json) => _$ImpactBaselineFromJson(json);

@override@JsonKey(name: 'total_911_calls') final  int total911Calls;
@override@JsonKey(name: 'zone_911_calls') final  int zone911Calls;
@override@JsonKey(name: 'safety_911_calls_in_zone') final  int safety911CallsInZone;
@override@JsonKey(name: 'zone_share_of_city_calls') final  double zoneShareOfCityCalls;

/// Create a copy of ImpactBaseline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImpactBaselineCopyWith<_ImpactBaseline> get copyWith => __$ImpactBaselineCopyWithImpl<_ImpactBaseline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImpactBaselineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImpactBaseline&&(identical(other.total911Calls, total911Calls) || other.total911Calls == total911Calls)&&(identical(other.zone911Calls, zone911Calls) || other.zone911Calls == zone911Calls)&&(identical(other.safety911CallsInZone, safety911CallsInZone) || other.safety911CallsInZone == safety911CallsInZone)&&(identical(other.zoneShareOfCityCalls, zoneShareOfCityCalls) || other.zoneShareOfCityCalls == zoneShareOfCityCalls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total911Calls,zone911Calls,safety911CallsInZone,zoneShareOfCityCalls);

@override
String toString() {
  return 'ImpactBaseline(total911Calls: $total911Calls, zone911Calls: $zone911Calls, safety911CallsInZone: $safety911CallsInZone, zoneShareOfCityCalls: $zoneShareOfCityCalls)';
}


}

/// @nodoc
abstract mixin class _$ImpactBaselineCopyWith<$Res> implements $ImpactBaselineCopyWith<$Res> {
  factory _$ImpactBaselineCopyWith(_ImpactBaseline value, $Res Function(_ImpactBaseline) _then) = __$ImpactBaselineCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_911_calls') int total911Calls,@JsonKey(name: 'zone_911_calls') int zone911Calls,@JsonKey(name: 'safety_911_calls_in_zone') int safety911CallsInZone,@JsonKey(name: 'zone_share_of_city_calls') double zoneShareOfCityCalls
});




}
/// @nodoc
class __$ImpactBaselineCopyWithImpl<$Res>
    implements _$ImpactBaselineCopyWith<$Res> {
  __$ImpactBaselineCopyWithImpl(this._self, this._then);

  final _ImpactBaseline _self;
  final $Res Function(_ImpactBaseline) _then;

/// Create a copy of ImpactBaseline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total911Calls = null,Object? zone911Calls = null,Object? safety911CallsInZone = null,Object? zoneShareOfCityCalls = null,}) {
  return _then(_ImpactBaseline(
total911Calls: null == total911Calls ? _self.total911Calls : total911Calls // ignore: cast_nullable_to_non_nullable
as int,zone911Calls: null == zone911Calls ? _self.zone911Calls : zone911Calls // ignore: cast_nullable_to_non_nullable
as int,safety911CallsInZone: null == safety911CallsInZone ? _self.safety911CallsInZone : safety911CallsInZone // ignore: cast_nullable_to_non_nullable
as int,zoneShareOfCityCalls: null == zoneShareOfCityCalls ? _self.zoneShareOfCityCalls : zoneShareOfCityCalls // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ImpactProjection {

@JsonKey(name: 'projected_calls_avoided_low') int get projectedCallsAvoidedLow;@JsonKey(name: 'projected_calls_avoided_mid') int get projectedCallsAvoidedMid;@JsonKey(name: 'projected_calls_avoided_high') int get projectedCallsAvoidedHigh;@JsonKey(name: 'projected_lives_impacted') int get projectedLivesImpacted;@JsonKey(name: 'estimated_emergency_cost_savings') double get estimatedEmergencyCostSavings;@JsonKey(name: 'vitality_recovery_percent') double get vitalityRecoveryPercent;
/// Create a copy of ImpactProjection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImpactProjectionCopyWith<ImpactProjection> get copyWith => _$ImpactProjectionCopyWithImpl<ImpactProjection>(this as ImpactProjection, _$identity);

  /// Serializes this ImpactProjection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImpactProjection&&(identical(other.projectedCallsAvoidedLow, projectedCallsAvoidedLow) || other.projectedCallsAvoidedLow == projectedCallsAvoidedLow)&&(identical(other.projectedCallsAvoidedMid, projectedCallsAvoidedMid) || other.projectedCallsAvoidedMid == projectedCallsAvoidedMid)&&(identical(other.projectedCallsAvoidedHigh, projectedCallsAvoidedHigh) || other.projectedCallsAvoidedHigh == projectedCallsAvoidedHigh)&&(identical(other.projectedLivesImpacted, projectedLivesImpacted) || other.projectedLivesImpacted == projectedLivesImpacted)&&(identical(other.estimatedEmergencyCostSavings, estimatedEmergencyCostSavings) || other.estimatedEmergencyCostSavings == estimatedEmergencyCostSavings)&&(identical(other.vitalityRecoveryPercent, vitalityRecoveryPercent) || other.vitalityRecoveryPercent == vitalityRecoveryPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectedCallsAvoidedLow,projectedCallsAvoidedMid,projectedCallsAvoidedHigh,projectedLivesImpacted,estimatedEmergencyCostSavings,vitalityRecoveryPercent);

@override
String toString() {
  return 'ImpactProjection(projectedCallsAvoidedLow: $projectedCallsAvoidedLow, projectedCallsAvoidedMid: $projectedCallsAvoidedMid, projectedCallsAvoidedHigh: $projectedCallsAvoidedHigh, projectedLivesImpacted: $projectedLivesImpacted, estimatedEmergencyCostSavings: $estimatedEmergencyCostSavings, vitalityRecoveryPercent: $vitalityRecoveryPercent)';
}


}

/// @nodoc
abstract mixin class $ImpactProjectionCopyWith<$Res>  {
  factory $ImpactProjectionCopyWith(ImpactProjection value, $Res Function(ImpactProjection) _then) = _$ImpactProjectionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'projected_calls_avoided_low') int projectedCallsAvoidedLow,@JsonKey(name: 'projected_calls_avoided_mid') int projectedCallsAvoidedMid,@JsonKey(name: 'projected_calls_avoided_high') int projectedCallsAvoidedHigh,@JsonKey(name: 'projected_lives_impacted') int projectedLivesImpacted,@JsonKey(name: 'estimated_emergency_cost_savings') double estimatedEmergencyCostSavings,@JsonKey(name: 'vitality_recovery_percent') double vitalityRecoveryPercent
});




}
/// @nodoc
class _$ImpactProjectionCopyWithImpl<$Res>
    implements $ImpactProjectionCopyWith<$Res> {
  _$ImpactProjectionCopyWithImpl(this._self, this._then);

  final ImpactProjection _self;
  final $Res Function(ImpactProjection) _then;

/// Create a copy of ImpactProjection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectedCallsAvoidedLow = null,Object? projectedCallsAvoidedMid = null,Object? projectedCallsAvoidedHigh = null,Object? projectedLivesImpacted = null,Object? estimatedEmergencyCostSavings = null,Object? vitalityRecoveryPercent = null,}) {
  return _then(_self.copyWith(
projectedCallsAvoidedLow: null == projectedCallsAvoidedLow ? _self.projectedCallsAvoidedLow : projectedCallsAvoidedLow // ignore: cast_nullable_to_non_nullable
as int,projectedCallsAvoidedMid: null == projectedCallsAvoidedMid ? _self.projectedCallsAvoidedMid : projectedCallsAvoidedMid // ignore: cast_nullable_to_non_nullable
as int,projectedCallsAvoidedHigh: null == projectedCallsAvoidedHigh ? _self.projectedCallsAvoidedHigh : projectedCallsAvoidedHigh // ignore: cast_nullable_to_non_nullable
as int,projectedLivesImpacted: null == projectedLivesImpacted ? _self.projectedLivesImpacted : projectedLivesImpacted // ignore: cast_nullable_to_non_nullable
as int,estimatedEmergencyCostSavings: null == estimatedEmergencyCostSavings ? _self.estimatedEmergencyCostSavings : estimatedEmergencyCostSavings // ignore: cast_nullable_to_non_nullable
as double,vitalityRecoveryPercent: null == vitalityRecoveryPercent ? _self.vitalityRecoveryPercent : vitalityRecoveryPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ImpactProjection].
extension ImpactProjectionPatterns on ImpactProjection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImpactProjection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImpactProjection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImpactProjection value)  $default,){
final _that = this;
switch (_that) {
case _ImpactProjection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImpactProjection value)?  $default,){
final _that = this;
switch (_that) {
case _ImpactProjection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'projected_calls_avoided_low')  int projectedCallsAvoidedLow, @JsonKey(name: 'projected_calls_avoided_mid')  int projectedCallsAvoidedMid, @JsonKey(name: 'projected_calls_avoided_high')  int projectedCallsAvoidedHigh, @JsonKey(name: 'projected_lives_impacted')  int projectedLivesImpacted, @JsonKey(name: 'estimated_emergency_cost_savings')  double estimatedEmergencyCostSavings, @JsonKey(name: 'vitality_recovery_percent')  double vitalityRecoveryPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImpactProjection() when $default != null:
return $default(_that.projectedCallsAvoidedLow,_that.projectedCallsAvoidedMid,_that.projectedCallsAvoidedHigh,_that.projectedLivesImpacted,_that.estimatedEmergencyCostSavings,_that.vitalityRecoveryPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'projected_calls_avoided_low')  int projectedCallsAvoidedLow, @JsonKey(name: 'projected_calls_avoided_mid')  int projectedCallsAvoidedMid, @JsonKey(name: 'projected_calls_avoided_high')  int projectedCallsAvoidedHigh, @JsonKey(name: 'projected_lives_impacted')  int projectedLivesImpacted, @JsonKey(name: 'estimated_emergency_cost_savings')  double estimatedEmergencyCostSavings, @JsonKey(name: 'vitality_recovery_percent')  double vitalityRecoveryPercent)  $default,) {final _that = this;
switch (_that) {
case _ImpactProjection():
return $default(_that.projectedCallsAvoidedLow,_that.projectedCallsAvoidedMid,_that.projectedCallsAvoidedHigh,_that.projectedLivesImpacted,_that.estimatedEmergencyCostSavings,_that.vitalityRecoveryPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'projected_calls_avoided_low')  int projectedCallsAvoidedLow, @JsonKey(name: 'projected_calls_avoided_mid')  int projectedCallsAvoidedMid, @JsonKey(name: 'projected_calls_avoided_high')  int projectedCallsAvoidedHigh, @JsonKey(name: 'projected_lives_impacted')  int projectedLivesImpacted, @JsonKey(name: 'estimated_emergency_cost_savings')  double estimatedEmergencyCostSavings, @JsonKey(name: 'vitality_recovery_percent')  double vitalityRecoveryPercent)?  $default,) {final _that = this;
switch (_that) {
case _ImpactProjection() when $default != null:
return $default(_that.projectedCallsAvoidedLow,_that.projectedCallsAvoidedMid,_that.projectedCallsAvoidedHigh,_that.projectedLivesImpacted,_that.estimatedEmergencyCostSavings,_that.vitalityRecoveryPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImpactProjection implements ImpactProjection {
  const _ImpactProjection({@JsonKey(name: 'projected_calls_avoided_low') required this.projectedCallsAvoidedLow, @JsonKey(name: 'projected_calls_avoided_mid') required this.projectedCallsAvoidedMid, @JsonKey(name: 'projected_calls_avoided_high') required this.projectedCallsAvoidedHigh, @JsonKey(name: 'projected_lives_impacted') required this.projectedLivesImpacted, @JsonKey(name: 'estimated_emergency_cost_savings') required this.estimatedEmergencyCostSavings, @JsonKey(name: 'vitality_recovery_percent') required this.vitalityRecoveryPercent});
  factory _ImpactProjection.fromJson(Map<String, dynamic> json) => _$ImpactProjectionFromJson(json);

@override@JsonKey(name: 'projected_calls_avoided_low') final  int projectedCallsAvoidedLow;
@override@JsonKey(name: 'projected_calls_avoided_mid') final  int projectedCallsAvoidedMid;
@override@JsonKey(name: 'projected_calls_avoided_high') final  int projectedCallsAvoidedHigh;
@override@JsonKey(name: 'projected_lives_impacted') final  int projectedLivesImpacted;
@override@JsonKey(name: 'estimated_emergency_cost_savings') final  double estimatedEmergencyCostSavings;
@override@JsonKey(name: 'vitality_recovery_percent') final  double vitalityRecoveryPercent;

/// Create a copy of ImpactProjection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImpactProjectionCopyWith<_ImpactProjection> get copyWith => __$ImpactProjectionCopyWithImpl<_ImpactProjection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImpactProjectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImpactProjection&&(identical(other.projectedCallsAvoidedLow, projectedCallsAvoidedLow) || other.projectedCallsAvoidedLow == projectedCallsAvoidedLow)&&(identical(other.projectedCallsAvoidedMid, projectedCallsAvoidedMid) || other.projectedCallsAvoidedMid == projectedCallsAvoidedMid)&&(identical(other.projectedCallsAvoidedHigh, projectedCallsAvoidedHigh) || other.projectedCallsAvoidedHigh == projectedCallsAvoidedHigh)&&(identical(other.projectedLivesImpacted, projectedLivesImpacted) || other.projectedLivesImpacted == projectedLivesImpacted)&&(identical(other.estimatedEmergencyCostSavings, estimatedEmergencyCostSavings) || other.estimatedEmergencyCostSavings == estimatedEmergencyCostSavings)&&(identical(other.vitalityRecoveryPercent, vitalityRecoveryPercent) || other.vitalityRecoveryPercent == vitalityRecoveryPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectedCallsAvoidedLow,projectedCallsAvoidedMid,projectedCallsAvoidedHigh,projectedLivesImpacted,estimatedEmergencyCostSavings,vitalityRecoveryPercent);

@override
String toString() {
  return 'ImpactProjection(projectedCallsAvoidedLow: $projectedCallsAvoidedLow, projectedCallsAvoidedMid: $projectedCallsAvoidedMid, projectedCallsAvoidedHigh: $projectedCallsAvoidedHigh, projectedLivesImpacted: $projectedLivesImpacted, estimatedEmergencyCostSavings: $estimatedEmergencyCostSavings, vitalityRecoveryPercent: $vitalityRecoveryPercent)';
}


}

/// @nodoc
abstract mixin class _$ImpactProjectionCopyWith<$Res> implements $ImpactProjectionCopyWith<$Res> {
  factory _$ImpactProjectionCopyWith(_ImpactProjection value, $Res Function(_ImpactProjection) _then) = __$ImpactProjectionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'projected_calls_avoided_low') int projectedCallsAvoidedLow,@JsonKey(name: 'projected_calls_avoided_mid') int projectedCallsAvoidedMid,@JsonKey(name: 'projected_calls_avoided_high') int projectedCallsAvoidedHigh,@JsonKey(name: 'projected_lives_impacted') int projectedLivesImpacted,@JsonKey(name: 'estimated_emergency_cost_savings') double estimatedEmergencyCostSavings,@JsonKey(name: 'vitality_recovery_percent') double vitalityRecoveryPercent
});




}
/// @nodoc
class __$ImpactProjectionCopyWithImpl<$Res>
    implements _$ImpactProjectionCopyWith<$Res> {
  __$ImpactProjectionCopyWithImpl(this._self, this._then);

  final _ImpactProjection _self;
  final $Res Function(_ImpactProjection) _then;

/// Create a copy of ImpactProjection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectedCallsAvoidedLow = null,Object? projectedCallsAvoidedMid = null,Object? projectedCallsAvoidedHigh = null,Object? projectedLivesImpacted = null,Object? estimatedEmergencyCostSavings = null,Object? vitalityRecoveryPercent = null,}) {
  return _then(_ImpactProjection(
projectedCallsAvoidedLow: null == projectedCallsAvoidedLow ? _self.projectedCallsAvoidedLow : projectedCallsAvoidedLow // ignore: cast_nullable_to_non_nullable
as int,projectedCallsAvoidedMid: null == projectedCallsAvoidedMid ? _self.projectedCallsAvoidedMid : projectedCallsAvoidedMid // ignore: cast_nullable_to_non_nullable
as int,projectedCallsAvoidedHigh: null == projectedCallsAvoidedHigh ? _self.projectedCallsAvoidedHigh : projectedCallsAvoidedHigh // ignore: cast_nullable_to_non_nullable
as int,projectedLivesImpacted: null == projectedLivesImpacted ? _self.projectedLivesImpacted : projectedLivesImpacted // ignore: cast_nullable_to_non_nullable
as int,estimatedEmergencyCostSavings: null == estimatedEmergencyCostSavings ? _self.estimatedEmergencyCostSavings : estimatedEmergencyCostSavings // ignore: cast_nullable_to_non_nullable
as double,vitalityRecoveryPercent: null == vitalityRecoveryPercent ? _self.vitalityRecoveryPercent : vitalityRecoveryPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
