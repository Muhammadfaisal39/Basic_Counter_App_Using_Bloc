import 'package:counter_app_bloc/features/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
          // counterBloc.add(CounterIncrementActionEvent());
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: counterBloc,
        listenWhen: (previous, current)=> current is CounterActionState,
        buildWhen: (previous, current)=> current is !CounterActionState,
        listener: (context, state) {
          if(state is ShowSnakBar){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("SnakBar Appears"))
            );
          }
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case IncrementCounter :
              final successState = state as IncrementCounter;
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        successState.val.toString(), style: const TextStyle(
                          fontSize: 60
                      ),),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            counterBloc.add(ShowSnakBarEvent());
                          }, child: Text("Show SnakBar")),
                    )
                  ],
                ),
              );
            case CounterInitial:
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "0", style: const TextStyle(
                          fontSize: 60
                      ),),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            counterBloc.add(ShowSnakBarEvent());
                          }, child: Text("Show SnakBar")),
                    )
                  ],
                ),
              );
            default:
              return SizedBox();

          }
        },
      ),
    );
  }
}

// BlocBuilder<CounterBloc, CounterState>(
// bloc: counterBloc,
// builder: (context, state) {
// switch(state.runtimeType){
// case IncrementCounter :
// final successState = state as IncrementCounter;
// return Container(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(
// child: Text(
// successState.val.toString(), style: const TextStyle(
// fontSize: 60
// ),),
// )
// ],
// ),
// );
// case CounterInitial :
// return Container(
// child: const Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(
// child: Text(
// "0", style: const TextStyle(
// fontSize: 60
// ),),
// )
// ],
// ),
// );
// default:
// return SizedBox();
// }
// },
// ),


// BlocListener<CounterBloc, CounterState>(
// bloc: counterBloc,
// listener: (context, state) {
// if(state is ShowSnakBar){
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text("Snakbar appear"))
// );
// }else if(state is IncrementCounterActionState){
// setState(() {
// val = val + 1;
// });
// }
// },
// child: Container(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Center(
// child: Text(
// "0", style: const TextStyle(
// fontSize: 60
// ),),
// ),
// SizedBox(
// height: 50,
// child: ElevatedButton(
// onPressed: () {
// counterBloc.add(ShowSnakBarEvent());
// }, child: Text("Show SnakBar")),
// )
// ],
// ),
// ),
// ),