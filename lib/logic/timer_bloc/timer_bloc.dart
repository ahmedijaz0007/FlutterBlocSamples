import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data_source/timer_ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _initialduration = 60;
  final Ticker ticker;
  StreamSubscription<int>? _tickerStream;
  TimerBloc({required this.ticker}) : super(const TimerInitial(_initialduration)) {
    on<TimerStartedEvent>(_onStarted);
    on<TimerPausedEvent>(_onPaused);
    on<TimerTickEvent>(_onTicked);
    on<TimerResetEvent>(_onReset);
    on<TimerResumedEvent>(_onResume);
  }


  void _onStarted(TimerStartedEvent event, Emitter<TimerState> emit) {
    emit(TimerRunning(event.duration));       //emit running state with provided duration by view
    _tickerStream?.cancel();  //cancel any stream running before
    _tickerStream = ticker      //start a new stream with provided duration
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTickEvent(duration: duration))); //add ticker event after each listen
  }

void _onResume(TimerResumedEvent event, Emitter<TimerState> emit)  {
   _tickerStream?.resume();
    emit(TimerRunning(state.duration));
}
  void _onPaused(TimerPausedEvent event, Emitter<TimerState> emit)  {
    _tickerStream?.pause();
    emit(TimerPaused(state.duration));
  }

  void _onReset(TimerResetEvent event, Emitter<TimerState> emit)  {
    _tickerStream?.cancel();
    emit(const TimerInitial(_initialduration));
  }
  void _onTicked(TimerTickEvent event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunning(event.duration)
          : const TimerCompleted(),
    );
  }

  @override
  Future<void> close() {
    _tickerStream?.cancel();
    return super.close();
  }
}
