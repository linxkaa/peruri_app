import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruri_app/application/counter_cubit/counter_cubit.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  static const fabIncrement = Key('fab-increment');
  static const fabDecrement = Key('fab-decrement');
  static const textCounter = Key('text-counter');
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Scaffold(
              appBar: PlatformAppBar(
                color: state.color,
                title: const Text('Counter App'),
                leading: IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              body: Center(
                child: Text(
                  '${state.value}',
                  key: textCounter,
                  style: context.textTheme.displayMedium,
                ),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    key: fabIncrement,
                    child: const Icon(Icons.add),
                    onPressed: () => context.read<CounterCubit>().increment(),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton(
                    key: fabDecrement,
                    child: const Icon(Icons.remove),
                    onPressed: () => context.read<CounterCubit>().decrement(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
