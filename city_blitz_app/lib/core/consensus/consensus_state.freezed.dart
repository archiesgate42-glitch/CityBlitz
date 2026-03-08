// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consensus_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsensusState {

/// The location being evaluated.
 String get location;// ── Input scores ──
 double get vibeScore; double get frictionScore; double get estimatedRoi;// ── Individual agent votes ──
 bool get residentUrgent; bool get municipalUrgent; bool get economyUrgent;// ── Consensus result ──
 int get urgentCount; bool get promotedToPriorityAlpha;/// The final priority label: "Priority Alpha" or "Standard".
 String get priority;/// Command verdict for the dashboard.
 String get commandVerdict;
/// Create a copy of ConsensusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsensusStateCopyWith<ConsensusState> get copyWith => _$ConsensusStateCopyWithImpl<ConsensusState>(this as ConsensusState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsensusState&&(identical(other.location, location) || other.location == location)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.estimatedRoi, estimatedRoi) || other.estimatedRoi == estimatedRoi)&&(identical(other.residentUrgent, residentUrgent) || other.residentUrgent == residentUrgent)&&(identical(other.municipalUrgent, municipalUrgent) || other.municipalUrgent == municipalUrgent)&&(identical(other.economyUrgent, economyUrgent) || other.economyUrgent == economyUrgent)&&(identical(other.urgentCount, urgentCount) || other.urgentCount == urgentCount)&&(identical(other.promotedToPriorityAlpha, promotedToPriorityAlpha) || other.promotedToPriorityAlpha == promotedToPriorityAlpha)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.commandVerdict, commandVerdict) || other.commandVerdict == commandVerdict));
}


@override
int get hashCode => Object.hash(runtimeType,location,vibeScore,frictionScore,estimatedRoi,residentUrgent,municipalUrgent,economyUrgent,urgentCount,promotedToPriorityAlpha,priority,commandVerdict);

@override
String toString() {
  return 'ConsensusState(location: $location, vibeScore: $vibeScore, frictionScore: $frictionScore, estimatedRoi: $estimatedRoi, residentUrgent: $residentUrgent, municipalUrgent: $municipalUrgent, economyUrgent: $economyUrgent, urgentCount: $urgentCount, promotedToPriorityAlpha: $promotedToPriorityAlpha, priority: $priority, commandVerdict: $commandVerdict)';
}


}

/// @nodoc
abstract mixin class $ConsensusStateCopyWith<$Res>  {
  factory $ConsensusStateCopyWith(ConsensusState value, $Res Function(ConsensusState) _then) = _$ConsensusStateCopyWithImpl;
@useResult
$Res call({
 String location, double vibeScore, double frictionScore, double estimatedRoi, bool residentUrgent, bool municipalUrgent, bool economyUrgent, int urgentCount, bool promotedToPriorityAlpha, String priority, String commandVerdict
});




}
/// @nodoc
class _$ConsensusStateCopyWithImpl<$Res>
    implements $ConsensusStateCopyWith<$Res> {
  _$ConsensusStateCopyWithImpl(this._self, this._then);

  final ConsensusState _self;
  final $Res Function(ConsensusState) _then;

/// Create a copy of ConsensusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = null,Object? vibeScore = null,Object? frictionScore = null,Object? estimatedRoi = null,Object? residentUrgent = null,Object? municipalUrgent = null,Object? economyUrgent = null,Object? urgentCount = null,Object? promotedToPriorityAlpha = null,Object? priority = null,Object? commandVerdict = null,}) {
  return _then(_self.copyWith(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,vibeScore: null == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,estimatedRoi: null == estimatedRoi ? _self.estimatedRoi : estimatedRoi // ignore: cast_nullable_to_non_nullable
as double,residentUrgent: null == residentUrgent ? _self.residentUrgent : residentUrgent // ignore: cast_nullable_to_non_nullable
as bool,municipalUrgent: null == municipalUrgent ? _self.municipalUrgent : municipalUrgent // ignore: cast_nullable_to_non_nullable
as bool,economyUrgent: null == economyUrgent ? _self.economyUrgent : economyUrgent // ignore: cast_nullable_to_non_nullable
as bool,urgentCount: null == urgentCount ? _self.urgentCount : urgentCount // ignore: cast_nullable_to_non_nullable
as int,promotedToPriorityAlpha: null == promotedToPriorityAlpha ? _self.promotedToPriorityAlpha : promotedToPriorityAlpha // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,commandVerdict: null == commandVerdict ? _self.commandVerdict : commandVerdict // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsensusState].
extension ConsensusStatePatterns on ConsensusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsensusState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsensusState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsensusState value)  $default,){
final _that = this;
switch (_that) {
case _ConsensusState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsensusState value)?  $default,){
final _that = this;
switch (_that) {
case _ConsensusState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String location,  double vibeScore,  double frictionScore,  double estimatedRoi,  bool residentUrgent,  bool municipalUrgent,  bool economyUrgent,  int urgentCount,  bool promotedToPriorityAlpha,  String priority,  String commandVerdict)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsensusState() when $default != null:
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.estimatedRoi,_that.residentUrgent,_that.municipalUrgent,_that.economyUrgent,_that.urgentCount,_that.promotedToPriorityAlpha,_that.priority,_that.commandVerdict);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String location,  double vibeScore,  double frictionScore,  double estimatedRoi,  bool residentUrgent,  bool municipalUrgent,  bool economyUrgent,  int urgentCount,  bool promotedToPriorityAlpha,  String priority,  String commandVerdict)  $default,) {final _that = this;
switch (_that) {
case _ConsensusState():
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.estimatedRoi,_that.residentUrgent,_that.municipalUrgent,_that.economyUrgent,_that.urgentCount,_that.promotedToPriorityAlpha,_that.priority,_that.commandVerdict);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String location,  double vibeScore,  double frictionScore,  double estimatedRoi,  bool residentUrgent,  bool municipalUrgent,  bool economyUrgent,  int urgentCount,  bool promotedToPriorityAlpha,  String priority,  String commandVerdict)?  $default,) {final _that = this;
switch (_that) {
case _ConsensusState() when $default != null:
return $default(_that.location,_that.vibeScore,_that.frictionScore,_that.estimatedRoi,_that.residentUrgent,_that.municipalUrgent,_that.economyUrgent,_that.urgentCount,_that.promotedToPriorityAlpha,_that.priority,_that.commandVerdict);case _:
  return null;

}
}

}

/// @nodoc


class _ConsensusState extends ConsensusState {
  const _ConsensusState({required this.location, required this.vibeScore, required this.frictionScore, required this.estimatedRoi, required this.residentUrgent, required this.municipalUrgent, required this.economyUrgent, required this.urgentCount, required this.promotedToPriorityAlpha, required this.priority, required this.commandVerdict}): super._();
  

/// The location being evaluated.
@override final  String location;
// ── Input scores ──
@override final  double vibeScore;
@override final  double frictionScore;
@override final  double estimatedRoi;
// ── Individual agent votes ──
@override final  bool residentUrgent;
@override final  bool municipalUrgent;
@override final  bool economyUrgent;
// ── Consensus result ──
@override final  int urgentCount;
@override final  bool promotedToPriorityAlpha;
/// The final priority label: "Priority Alpha" or "Standard".
@override final  String priority;
/// Command verdict for the dashboard.
@override final  String commandVerdict;

/// Create a copy of ConsensusState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsensusStateCopyWith<_ConsensusState> get copyWith => __$ConsensusStateCopyWithImpl<_ConsensusState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsensusState&&(identical(other.location, location) || other.location == location)&&(identical(other.vibeScore, vibeScore) || other.vibeScore == vibeScore)&&(identical(other.frictionScore, frictionScore) || other.frictionScore == frictionScore)&&(identical(other.estimatedRoi, estimatedRoi) || other.estimatedRoi == estimatedRoi)&&(identical(other.residentUrgent, residentUrgent) || other.residentUrgent == residentUrgent)&&(identical(other.municipalUrgent, municipalUrgent) || other.municipalUrgent == municipalUrgent)&&(identical(other.economyUrgent, economyUrgent) || other.economyUrgent == economyUrgent)&&(identical(other.urgentCount, urgentCount) || other.urgentCount == urgentCount)&&(identical(other.promotedToPriorityAlpha, promotedToPriorityAlpha) || other.promotedToPriorityAlpha == promotedToPriorityAlpha)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.commandVerdict, commandVerdict) || other.commandVerdict == commandVerdict));
}


@override
int get hashCode => Object.hash(runtimeType,location,vibeScore,frictionScore,estimatedRoi,residentUrgent,municipalUrgent,economyUrgent,urgentCount,promotedToPriorityAlpha,priority,commandVerdict);

@override
String toString() {
  return 'ConsensusState(location: $location, vibeScore: $vibeScore, frictionScore: $frictionScore, estimatedRoi: $estimatedRoi, residentUrgent: $residentUrgent, municipalUrgent: $municipalUrgent, economyUrgent: $economyUrgent, urgentCount: $urgentCount, promotedToPriorityAlpha: $promotedToPriorityAlpha, priority: $priority, commandVerdict: $commandVerdict)';
}


}

/// @nodoc
abstract mixin class _$ConsensusStateCopyWith<$Res> implements $ConsensusStateCopyWith<$Res> {
  factory _$ConsensusStateCopyWith(_ConsensusState value, $Res Function(_ConsensusState) _then) = __$ConsensusStateCopyWithImpl;
@override @useResult
$Res call({
 String location, double vibeScore, double frictionScore, double estimatedRoi, bool residentUrgent, bool municipalUrgent, bool economyUrgent, int urgentCount, bool promotedToPriorityAlpha, String priority, String commandVerdict
});




}
/// @nodoc
class __$ConsensusStateCopyWithImpl<$Res>
    implements _$ConsensusStateCopyWith<$Res> {
  __$ConsensusStateCopyWithImpl(this._self, this._then);

  final _ConsensusState _self;
  final $Res Function(_ConsensusState) _then;

/// Create a copy of ConsensusState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = null,Object? vibeScore = null,Object? frictionScore = null,Object? estimatedRoi = null,Object? residentUrgent = null,Object? municipalUrgent = null,Object? economyUrgent = null,Object? urgentCount = null,Object? promotedToPriorityAlpha = null,Object? priority = null,Object? commandVerdict = null,}) {
  return _then(_ConsensusState(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,vibeScore: null == vibeScore ? _self.vibeScore : vibeScore // ignore: cast_nullable_to_non_nullable
as double,frictionScore: null == frictionScore ? _self.frictionScore : frictionScore // ignore: cast_nullable_to_non_nullable
as double,estimatedRoi: null == estimatedRoi ? _self.estimatedRoi : estimatedRoi // ignore: cast_nullable_to_non_nullable
as double,residentUrgent: null == residentUrgent ? _self.residentUrgent : residentUrgent // ignore: cast_nullable_to_non_nullable
as bool,municipalUrgent: null == municipalUrgent ? _self.municipalUrgent : municipalUrgent // ignore: cast_nullable_to_non_nullable
as bool,economyUrgent: null == economyUrgent ? _self.economyUrgent : economyUrgent // ignore: cast_nullable_to_non_nullable
as bool,urgentCount: null == urgentCount ? _self.urgentCount : urgentCount // ignore: cast_nullable_to_non_nullable
as int,promotedToPriorityAlpha: null == promotedToPriorityAlpha ? _self.promotedToPriorityAlpha : promotedToPriorityAlpha // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,commandVerdict: null == commandVerdict ? _self.commandVerdict : commandVerdict // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
