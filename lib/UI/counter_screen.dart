
import 'package:counter_app/bloc/counter/counter_bloc.dart';
import 'package:counter_app/bloc/counter/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Counter"),),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
            return   Center
              (child: Text(state.counter.toString(),style: TextStyle(fontSize: 60),));
          }),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
            ElevatedButton(onPressed:(){
              context.read<CounterBloc>().add(IncrementCounter());
            }, child: Text("Increment")),
            SizedBox(width: 40,),
            ElevatedButton(onPressed:(){
              context.read<CounterBloc>().add(DecrementCounter());
            }, child: Text("dcrement")),


          ],)

        ],
      ),
    );
  }
}
