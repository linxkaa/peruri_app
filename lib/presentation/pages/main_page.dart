import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';
import 'package:peruri_app/presentation/widgets/molecules/action_text.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: UIHelper.padding(all: 20),
          child: Column(
            children: [
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const DummyUIPartOneRoute());
                },
                title: 'Dummy UI',
                desc: 'Pengenalan widget dasar di flutter',
              ),
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const CounterRoute());
                },
                title: 'Counter Example (State Management)',
                desc: 'Pengenalan state management menggunakan flutter_bloc package. Level: 1',
              ),
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const InputValidationRoute());
                },
                title: 'Input Validation Example (State Management)',
                desc: 'Pengenalan state management menggunakan flutter_bloc package. Level: 2',
              ),
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const CalculatorRoute());
                },
                title: 'Calculator Example (State Management)',
                desc: 'Case state management menggunakan flutter_bloc package yang lebih complex. Level: 3',
              ),
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const NewsRoute());
                },
                title: 'News App',
                desc: 'API Calling menggunakan free source dari NYTimes',
              ),
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const AARIntegrationRoute());
                },
                title: 'Implementasi Native Android di Flutter',
                desc: 'Memanggil function getVersi dari android menggunakan Method Channel',
              ),
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const TransformSignatureRoute());
                },
                title: 'Signature Page',
                desc:
                    'Implementasi tanda tangan yang akan di save ke local storage, lalu digunakan ke transform box yang bisa digerakan dimanapun di page.',
              ),
              ActionText(
                onTap: () {
                  AutoRouter.of(context).push(const ToDoRoute());
                },
                title: 'To Do App',
                desc: 'Membuat to do list untuk latihan state management flutter_bloc',
                needDivider: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
