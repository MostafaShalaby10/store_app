
import 'package:flutter_bloc/flutter_bloc.dart';
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
          emit(
            SuccessfullyGetProfileDataState(
              message: profileModel.message!,
              status: profileModel.status!,
            ),
          );
        })
        .catchError((error) {
          emit(ErrorGetProfileDataState(error.toString()));
        });
  }
}
