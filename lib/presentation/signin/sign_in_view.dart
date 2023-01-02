import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:travel_planner/presentation/common/buttons/primary_button.dart';
import 'package:travel_planner/presentation/common/scaffold/scaffold.dart';
import 'package:travel_planner/presentation/common/textfield/custom_textfield.dart';
import 'package:travel_planner/presentation/common/validators/form_validators.dart';
import 'package:travel_planner/presentation/design/color_pallete.dart';
import 'package:travel_planner/presentation/design/ui_helpers.dart';
import 'package:travel_planner/presentation/signin/sign_in_viewmodel.dart';

import 'sign_in_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: FormValidators.emailValidator),
  FormTextField(name: 'password', validator: FormValidators.passwordValidator),
])
class SignInView extends StatelessWidget with $SignInView {
  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      onModelReady: (viewModel) {
        listenToFormUpdated(viewModel);
      },
      onDispose: (model) => disposeForm(),
      builder: (context, viewModel, child) => TravelScaffold(
        title: "Login",
        body: Center(
          child: Column(
            children: [
              TravelTextfield(
                textEditingController: emailController,
                focusNode: emailFocusNode,
                hintText: "Email",
                maxWidth: 300,
                keyboardType: TextInputType.emailAddress,
              ),
              if (viewModel.hasEmailValidationMessage)
                Text(
                  viewModel.emailValidationMessage!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ColorPalette.error),
                ),
              UIHelper.verticalSpaceMedium(),
              TravelTextfield(
                textEditingController: passwordController,
                focusNode: passwordFocusNode,
                hintText: "Password",
                maxWidth: 300,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              if (viewModel.hasPasswordValidationMessage)
                Text(
                  viewModel.passwordValidationMessage!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ColorPalette.error),
                ),
              if (viewModel.showValidationMessage)
                Text(
                  viewModel.validationMessage!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ColorPalette.error),
                ),
              UIHelper.verticalSpaceMedium(),
              PrimaryTextButton(
                onPressed: () async {
                  await viewModel.onSignInPressed();
                },
                title: "Sign in",
              ),
              UIHelper.verticalSpaceMedium(),
              PrimaryTextButton(
                onPressed: () async {
                  await viewModel.onRegisterPressed();
                },
                title: "Register",
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}
