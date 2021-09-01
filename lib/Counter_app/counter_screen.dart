import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Counter_app/Cubit.dart';
import 'package:untitled/Counter_app/States.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>CounterCubit() ,
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (BuildContext context,CounterStates state) {},
        builder: (BuildContext context,CounterStates state){
          return  Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed:()
                    {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'Minus',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).plus();
                    },
                    child:
                    Text('Plus'),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
