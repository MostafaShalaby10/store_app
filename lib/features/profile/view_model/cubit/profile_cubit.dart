import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/profile/model/models/user_data/user_data.dart';
import 'package:shop_app/features/profile/model/repos/profile_repo_interface.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepoInterface _profileRepoInterface;
  ProfileCubit(this._profileRepoInterface) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  late final UserDataModel profileModel;

  Future getProfileData() async {
    emit(LoadingGetProfileDataState());
    await _profileRepoInterface
        .getProfileData()
        .then((value) {
          profileModel = UserDataModel.fromJson(value.data);
          emit(SuccessfullyGetProfileDataState(status: profileModel.status!));
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorGetProfileDataState(error.toString()));
        });
  }

  Future logout() {
    emit(LoadingLogOutState());
    return _profileRepoInterface
        .logout()
        .then((value) {
          emit(
            SuccessfullyLogOutState(
              status: value.data["status"],
              message: value.data["message"],
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorLogOutState(error.toString()));
        });
  }
}
