

import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);

  }


}