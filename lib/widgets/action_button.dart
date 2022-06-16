import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_with_bloc/bloc/user_bloc.dart';
import 'package:http_with_bloc/bloc/user_event.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc _bloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            _bloc.add(UserLoadEvent());
          },
          child: const Text('Load'),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            _bloc.add(UserClearEvent());
          },
          child: Text('Clear'),
          style: ElevatedButton.styleFrom(primary: Colors.red),
        ),
      ],
    );
  }
}
