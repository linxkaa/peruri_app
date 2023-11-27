import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peruri_app/application/to_do_cubit/to_do_cubit.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/organism/text_form_field.dart';
import 'package:peruri_app/presentation/widgets/organism/ui_helper.dart';

@RoutePage()
class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<ToDoCubit, ToDoState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('To Do Page'),
              ),
              bottomNavigationBar: Container(
                margin: UIHelper.padding(horizontal: 10, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ToDoCubit>().submit();
                  },
                  child: const Text(
                    'SAVE',
                  ),
                ),
              ),
              body: SingleChildScrollView(
                padding: UIHelper.padding(all: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormFieldCustom(
                      maxLines: 3,
                      title: 'To Do',
                      controller: context.read<ToDoCubit>().textController,
                      hintText: 'Masukkan todo task kamu..',
                      validator: (_) => state.showTextError,
                    ),
                    UIHelper.verticalSpace(10),
                    UIHelper.verticalSpace(20),
                    Text(
                      'HISTORY',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: ColorConstant.green,
                      ),
                    ),
                    UIHelper.verticalSpace(10),
                    state.entity.histories.isEmpty
                        ? Text(
                            'No history found',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: ColorConstant.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        : Column(
                            children: state.entity.histories
                                .map(
                                  (e) => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(child: Text(e.text)),
                                                UIHelper.horizontalSpace(5),
                                                if (e.id == state.entity.id)
                                                  Text(
                                                    '(edited)',
                                                    style: context.textTheme.labelSmall?.copyWith(
                                                      color: ColorConstant.grey,
                                                      fontStyle: FontStyle.italic,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              context.read<ToDoCubit>().restoreHistory(e.id);
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: ColorConstant.primary,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              context.read<ToDoCubit>().removeHistory(e.id);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: ColorConstant.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                )
                                .toList(),
                          )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
