part of 'timer_bloc.dart';

@immutable
abstract class TimerState  extends Equatable{
 const TimerState(this.duration);
 final int duration;
 @override

 List<Object?> get props => [duration];

}

class TimerInitial extends TimerState {
 const TimerInitial(super.duration);

 @override
 String toString() => "Timer_Initial = $duration";



}

class TimerRunning extends TimerState {
 const TimerRunning(super.duration);

 @override
 String toString() => "TimerRunning = $duration";

}

class TimerPaused extends TimerState {
 const TimerPaused(super.duration);

 @override
 String toString() => "TimerPaused = $duration";

}
class TimerCompleted extends TimerState {
 const TimerCompleted():super(0);

 @override
 String toString() => "TimerCompleted = $duration";

}


