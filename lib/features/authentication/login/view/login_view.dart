import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utilis/service_locator.dart';
import '../../../../core/widgets/custom_button_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../home/view/home_view.dart';
import '../../register/view/register_view.dart';
import '../model/repos/login_repo_imp.dart';
import '../view_model/cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepoImp>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessfullyLoginFunction) {
            if (state.status) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
                (route) => false,
              );
            } else if (!state.status) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          } else if (state is ErrorLoginFunction) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          var loginCubit = LoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      spacing: 5.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWidget(
                          text: 'Login',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                        const CustomTextWidget(
                          text: 'Welcome to the login page!',
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.grey,
                        ),
                        CustomTextFormFieldWidget(
                          textInputType: TextInputType.emailAddress,
                          hintText: "Email",
                          prefixIcon: Icons.email,
                          controller: emailController,
                        ),
                        CustomTextFormFieldWidget(
                          textInputType: TextInputType.visiblePassword,
                          hintText: "Password",
                          prefixIcon: Icons.lock,
                          controller: passwordController,
                          obscureText: loginCubit.isPassword,
                          suffixIcon:
                              loginCubit.isPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                          suffixOnPressed: () {
                            loginCubit.changePasswordVisiability();
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const CustomTextWidget(
                              text: "Forget Password",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: Colors.red,
                            ),
                          ),
                        ),
                        state is! LoadingLoginFunction
                            ? SizedBox(
                              width: double.infinity,
                              child: CustomButtonWidget(
                                text: "Login",
                                onPressed: () {
                                      FocusScope.of(context).unfocus();
                                  if (formKey.currentState!.validate()) {
                                    loginCubit.loginFunction(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                            )
                            : const Center(child: CircularProgressIndicator()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const CustomTextWidget(
                              text: "Don't have an account?",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterView(),
                                  ),
                                );
                              },
                              child: const CustomTextWidget(
                                text: "Signup",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
