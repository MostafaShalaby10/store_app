import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/core/utilis/service_locator.dart';
import 'package:shop_app/core/utilis/shared_prefrences.dart';
import 'package:shop_app/core/widgets/custom_button_widget.dart';
import 'package:shop_app/core/widgets/custom_text_widget.dart';
import 'package:shop_app/features/authentication/login/view/login_view.dart';
import 'package:shop_app/features/profile/model/repos/profile_repo_imp.dart';
import 'package:shop_app/features/profile/view_model/cubit/profile_cubit.dart';
import 'package:shop_app/core/theme/view_model/cubit/theme_cubit.dart';

import '../../update_data/view/update_data.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileCubit(getIt<ProfileRepoImp>())..getProfileData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          log(state.toString());
          if (state is SuccessfullyLogOutState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
              (predicate) => false,
            );
          }
        },
        builder: (context, state) {
          ProfileCubit profileCubit = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body:
                state is! LoadingGetProfileDataState
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10.w,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.network(
                                    profileCubit.profileModel.data!.image!,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 5.h,
                                  children: [
                                    CustomTextWidget(
                                      text:
                                          profileCubit.profileModel.data!.name!,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CustomTextWidget(
                                      text:
                                          profileCubit
                                              .profileModel
                                              .data!
                                              .email!,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      textColor: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (c) => UpdateData(
                                            userDataModel:
                                                profileCubit.profileModel,
                                          ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                          CustomButtonWidget(
                            text: "Change Theme",
                            onPressed: () {
                              // context.read<ThemeCubit>().changeTheme();
                              showModalBottomSheet(
                                context: context,
                                builder:
                                    (context) => StatefulBuilder(
                                      builder:
                                          (contetx, setState) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const CustomTextWidget(
                                                text: "Dark Mode",
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Switch(
                                                value:
                                                    SharedPrefs.getData(
                                                              key: "dark",
                                                            ) !=
                                                            null
                                                        ? true
                                                        : false,
                                                onChanged: (value) {
                                                  context
                                                      .read<ThemeCubit>()
                                                      .changeTheme();
                                                },
                                              ),
                                            ],
                                          ),
                                    ),
                              );
                            },
                          ),
                          state is! LoadingLogOutState
                              ? CustomButtonWidget(
                                text: "Logout",
                                onPressed: () {
                                  profileCubit.logout();
                                },
                              )
                              : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        ],
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
