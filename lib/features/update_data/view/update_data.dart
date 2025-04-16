import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utilis/service_locator.dart';
import 'package:shop_app/core/widgets/custom_button_widget.dart';
import 'package:shop_app/core/widgets/custom_text_form_field.dart';
import 'package:shop_app/features/profile/model/models/user_data/user_data.dart';

import '../model/repos/update_data_repo_imp.dart';
import '../view_model/cubit/update_data_cubit.dart';

class UpdateData extends StatelessWidget {
  final UserDataModel userDataModel;
  const UpdateData({super.key, required this.userDataModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return BlocProvider(
      create: (context) => UpdateDataCubit(getIt<UpdateDataRepoImp>()),
      child: BlocConsumer<UpdateDataCubit, UpdateDataState>(
        listener: (context, state) {
            if(state is SuccessfullyUpdateProfileDataState)
            {
                if(state.status)
                {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                  
                }
                else if(!state.status)
                {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
            }else if(state is ErrorUpdateProfileDataState)
            {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
            }
        },
        builder: (context, state) {
          nameController.text = userDataModel.data!.name!;
          emailController.text = userDataModel.data!.email!;
          phoneController.text = userDataModel.data!.phone!;
          UpdateDataCubit updateDataCubit = UpdateDataCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: Padding(
              padding:  const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 7.h,
                  children: [
                    CustomTextFormFieldWidget(
                      hintText: "Name",
                      prefixIcon: Icons.person,
                      textInputType: TextInputType.text,
                      controller: nameController,
                    ),
                    CustomTextFormFieldWidget(
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    CustomTextFormFieldWidget(
                      hintText: "Phone",
                      prefixIcon: Icons.phone_outlined,
                      textInputType: TextInputType.phone,
                      controller: phoneController,
                    ),
                  state is! LoadingUpdateProfileDataState ? SizedBox(
                      width: double.infinity,
                      child: CustomButtonWidget(
                        text: "Update",
                        onPressed: () {
                          updateDataCubit.updateDataFunction(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        },
                      ),
                    ):const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
