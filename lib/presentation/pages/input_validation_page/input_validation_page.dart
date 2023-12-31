import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peruri_app/application/input_validation_cubit/input_validation_cubit.dart';
import 'package:peruri_app/core/commons/assets_path.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputValidationCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: PlatformAppBar(
              title: const Text('Input Validation'),
              leading: IconButton(
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            bottomNavigationBar: Container(
              margin: UIHelper.padding(horizontal: 10, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  context.read<InputValidationCubit>().submit();
                },
                child: const Text(
                  'SUBMIT',
                ),
              ),
            ),
            body: BlocBuilder<InputValidationCubit, InputValidationState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: UIHelper.padding(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.title,
                        style: context.textTheme.displaySmall?.copyWith(
                          color: ColorConstant.primary,
                        ),
                      ),
                      Text(
                        state.description,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: ColorConstant.darkGrey,
                        ),
                      ),
                      UIHelper.verticalSpace(30),
                      TextFormFieldCustom(
                        hintText: 'Enter your name..',
                        validator: (_) => state.showNameError,
                        controller: context.read<InputValidationCubit>().nameController,
                        title: 'Name',
                        preffixIcon: SvgPicture.asset(
                          AssetsPath.userIcon,
                          width: UIHelper.setSp(15),
                        ),
                      ),
                      UIHelper.verticalSpace(20),
                      TextFormFieldCustom(
                        hintText: 'Enter your email..',
                        validator: (_) => state.showEmailError,
                        controller: context.read<InputValidationCubit>().emailController,
                        title: 'Email',
                        preffixIcon: SvgPicture.asset(
                          AssetsPath.emailIcon,
                          width: UIHelper.setSp(15),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
