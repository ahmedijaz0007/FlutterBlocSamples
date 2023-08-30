part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class TimerStartedEvent extends TimerEvent{
  final int duration;
  TimerStartedEvent({required this.duration});
}
class TimerPausedEvent extends TimerEvent{}
class TimerResumedEvent extends TimerEvent{}
class TimerResetEvent extends TimerEvent{}
class TimerTickEvent extends TimerEvent{
  final int duration;
  TimerTickEvent({required this.duration});
}

