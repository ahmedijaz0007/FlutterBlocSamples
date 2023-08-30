

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timerbloc/logic/timer_bloc/timer_bloc.dart';

class Timer extends StatelessWidget{
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children:  [
       TimerText(duration: 60,),
     ],
   );
  }
  
  
  
}

class Actions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   var state = context.watch<TimerBloc>().state;
    if (state is TimerRunning || state is TimerPaused){                //check incoming states here
     return Row(
       children: [
         IconButton(onPressed: (){
           context.read<TimerBloc>().add(TimerResumedEvent());
         }, icon: const Icon(Icons.play_arrow_sharp),),

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




}

class TimerText extends StatelessWidget {
  final int duration;//context.select((TimerBloc bloc) => bloc.state.duration);

  const TimerText({Key? key,required this.duration}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final minutesStr =
    ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}