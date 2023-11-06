import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';
import 'package:peruri_app/presentation/widgets/atoms/action_text.dart';
import 'package:peruri_app/presentation/widgets/organism/ui_helper.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
