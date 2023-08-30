

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timerbloc/logic/timer_bloc/timer_bloc.dart';

import '../data_source/timer_ticker.dart';

class Timer extends StatelessWidget{
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context)=>TimerBloc(ticker: const Ticker()),
     child: const Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children:  [
         TimerText(),
         SizedBox(height: 10,),
         Actions(),
       ],
     ),
   );
  }
  
  
  
}

class Actions extends StatelessWidget{
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
   //var state = context.watch<TimerBloc>().state;
    return BlocBuilder<TimerBloc,TimerState>(
      buildWhen:  (prev, state) => prev.runtimeType != state.runtimeType,   //we donot need to rebuild actions buttons on each tick but only when previous state type is not equal to type of new state. This makes it very efficient.
      builder: (context,state) {
        if (state is TimerRunning || state is TimerPaused){                //check incoming states here
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             if (state is TimerPaused)
               ...[IconButton(onPressed: () {
                  context.read<TimerBloc>().add(TimerResumedEvent());
                }, icon: const Icon(Icons.play_arrow_sharp),),]

              else
                ...[IconButton(onPressed: () {
                  context.read<TimerBloc>().add(TimerPausedEvent());
                }, icon: const Icon(Icons.pause),),],



              IconButton(onPressed: (){
                context.read<TimerBloc>().add(TimerResetEvent());
              }, icon: const Icon(Icons.restart_alt_sharp),),

            ],
          );


        }
        else{
          return  IconButton(onPressed: (){
            context.read<TimerBloc>().add(TimerStartedEvent(duration: 60));
          }, icon: const Icon(Icons.play_arrow_sharp),);

        }
      }
    );
    

  }




}

class TimerText extends StatelessWidget {


  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final int duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
    ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}