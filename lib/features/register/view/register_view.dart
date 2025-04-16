import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utilis/service_locator.dart';
import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../login/view/login_view.dart';
import '../model/repos/register_repo_imp.dart';
import '../view_model/cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<RegisterRepoImp>()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SuccessfullyRegisterState) {
            if (state.status) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
                (route) => false,
              );
            } else if (!state.status) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          } else if (state is ErrorRegisterState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
          // dispose Controllers here after success
        },
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      spacing: 5.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWidget(
                          text: "Create your new account",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const CustomTextWidget(
                          text:
                              "Create an account to start looking for the food you like",
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          textColor: Colors.black54,
                        ),
                        CustomTextFormFieldWidget(
                          textInputType: TextInputType.name,

                          hintText: "Name",
                          prefixIcon: Icons.person_2_outlined,
                          controller: nameController,
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
                          obscureText: registerCubit.isPassword,
                          suffixIcon:
                              registerCubit.isPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                          suffixOnPressed: () {
                            registerCubit.changePasswordVisiability();
                          },
                        ),
                        CustomTextFormFieldWidget(
                          textInputType: TextInputType.visiblePassword,

                          hintText: "Confirm Password",
                          prefixIcon: Icons.lock,
                          controller: confirmPasswordController,
                          obscureText: registerCubit.isConfirmPassword,
                          suffixIcon:
                              registerCubit.isConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                          suffixOnPressed: () {
                            registerCubit.changeConfirmPasswordVisiability();
                          },
                        ),
                        CustomTextFormFieldWidget(
                          textInputType: TextInputType.phone,
                          hintText: "Phone",
                          prefixIcon: Icons.phone,
                          controller: phoneController,
                        ),

                        state is! LoadingRegisterState
                            ? SizedBox(
                              width: double.infinity,
                              child: CustomButtonWidget(
                                text: "Create account",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (passwordController.text ==
                                        confirmPasswordController.text) {
                                      // Successfully create account
                                      registerCubit.registerFunction(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Passwords aren't match",
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            )
                            : const Center(child: CircularProgressIndicator()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const CustomTextWidget(
                              text: "Have an account?",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginView(),
                                  ),
                                );
                              },
                              child: const CustomTextWidget(
                                text: "Login",
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
