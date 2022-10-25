import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:travel_planner/presentation/common/buttons/primary_button.dart';
import 'package:travel_planner/presentation/common/textfield/custom_textfield.dart';
import 'package:travel_planner/presentation/common/validators/form_validators.dart';

import '../common/scaffold/scaffold.dart';
import '../design/color_pallete.dart';
import '../design/ui_helpers.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: FormValidators.emailValidator),
  FormTextField(name: 'password', validator: FormValidators.passwordValidator),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (viewModel) {
        listenToFormUpdated(viewModel);
      },
      onDispose: (model) => disposeForm(),
      builder: (context, viewModel, child) => ScreenTypeLayout.builder(
        mobile: (BuildContext context) => HotelScaffold(
          title: "Login",
          body: LoginFormView(
            login: () async {
              if (validateFormFields(viewModel)) {
                await viewModel.login();
              }
            },
            emailController: emailController,
            emailFocusNode: emailFocusNode,
            passwordController: passwordController,
            passwordFocusNode: passwordFocusNode,
          ),
        ),
      ),
    );
  }
}

class LoginFormView extends ViewModelWidget<LoginViewModel> {
  const LoginFormView({
    Key? key,
    required this.login,
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
  }) : super(key: key);

  final Future<void> Function() login;
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            HotelTextfield(
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
            HotelTextfield(
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
            SizedBox(
              width: 200,
              child: PrimaryTextButton(
                onPressed: () => login(),
                title: "Login",
                showLoading: viewModel.isBusy,
              ),
            )
          ],
        ),
      ),
    );
  }
}
